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
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to @guest, notice: 'Guest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      redirect_to @guest, notice: 'Guest was successfully updated.'
    else
      render :edit
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
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:attending, :first_name, :last_name, :phone_number, :address, :city_state, :zipcode, :reminders, :birth_alert, :see_photos)
    end
end
