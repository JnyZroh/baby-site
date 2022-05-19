class NotificationsController < ApplicationController
  before_action :require_login, only: [:index, :new]

  def new
    @guests = Guest.all
    guest = Guest.find(params[:guest])
    message = "Hi #{guest.first_name}, " + params[:message]
    number = guest.phone_number
    store_notification(message, guest)
    send_message(message, number)
    # raise
    redirect_to '/guests' , notice: "Message sent to #{guest.first_name} #{guest.last_name}!"
  end

  def index
    @guests = Guest.all
    @notifications = Notification.all
  end

end
