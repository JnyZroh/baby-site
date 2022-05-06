class GuestsController < ApplicationController
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
      redirect_to new_guest_path
    end
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      if @guest[:attending]== true
      redirect_to root_path, notice: "You have RSVP'd :) Zoom details will be sent soon"
      end

      if @guest[:attending]== false
        redirect_to root_path, notice: 'We wish you could join us! ❤️'
      end

    else
      render :new
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      if @guest.save
        if @guest[:attending]== true
        redirect_to root_path, notice: "You have RSVP'd :) Zoom details will be sent soon!"
        end

        if @guest[:attending]== false
          redirect_to root_path, notice: 'We wish you could join us! ❤️'
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
    @guest = Guest.find_by(phone_number: params[:phone_number])
    else
    @guest = Guest.find(params[:id])
    end
  end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:attending, :first_name, :last_name, :phone_number, :address, :city_state, :zipcode, :reminders, :birth_alert, :see_photos)
    end
end
