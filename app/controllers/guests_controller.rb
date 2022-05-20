class GuestsController < ApplicationController
  before_action :require_login, only: [:index, :show]
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
    if @guest.nil?
      redirect_to new_guest_path, notice: "Are you sure you used that number to RSVP? If so, please go back and put your number in again."
    end
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)
    number = @guest.phone_number
    @guest.phone_number = @guest.phone_number.gsub(/[^0-9.]/,'')
    if @guest.save
      if @guest[:attending]== true
        message = "Hi #{@guest.first_name}, this confirms your RSVP for Janaya's baby shower on Sunday, June 12th at 3pm. The Zoom link will be sent to you by text, the day before the event."
        store_notification(message, @guest, '')
        send_message(message, number)
        redirect_to questions_path, notice: "You have RSVP'd :) Zoom details will be sent soon"
      end

      if @guest[:attending]== false
        message = "Hi #{@guest.first_name}, thank you for letting us know that you cannot join us for Janaya's baby shower! If that changes, you can update your RSVP by returning to the https://bit.ly/babyzroh and clicking 'More Info'."
        store_notification(message, @guest, '')
        send_message(message, number)
        redirect_to questions_path, notice: 'We wish you could join us! ❤️'
      end

    else
      render :new
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      @guest.phone_number = @guest.phone_number.gsub(/[^0-9.]/,'')
      if @guest.save
        number = @guest.phone_number
        if @guest[:attending]== true
        message = "Hi #{@guest.first_name}, you have updated your RSVP and this message confirms that you are joining us for Janaya's baby shower on Sunday, June 12th at 3pm. The Zoom link will be sent to you by text, the day before the event."
        store_notification(message, @guest, '')
        send_message(message, number)
        redirect_to questions_path, notice: "You have RSVP'd :) Zoom details will be sent soon!"
        end

        if @guest[:attending]== false
          message = "Hi #{@guest.first_name}, you have updated your RSVP and this message confirms that you are not coming to the baby shower."
          store_notification(message, @guest, '')
          send_message(message, number)
          redirect_to questions_path, notice: 'We wish you could join us! ❤️'
        end
      else
        render :edit
      end
    end
  end

  # DELETE /guests/1
  def destroy
    @guest.destroy
    redirect_to guests_url, notice: 'Guest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_guest
    if !params[:phone_number].nil?
      number = params[:phone_number].gsub(/[^0-9.]/,'')
      @guest = Guest.find_by(phone_number: number)
    else
      @guest = Guest.find(params[:id])
    end
  end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:attending, :first_name, :last_name, :phone_number, :address, :city_state, :zipcode, :reminders, :birth_alert, :see_photos)
    end
end
