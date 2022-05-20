class NotificationsController < ApplicationController
  before_action :require_login, only: [:index, :new]

  def new
    # @guests = Guest.all
    # guest = Guest.find(params[:guest])
    @message = params[:message]
    number = params[:number]
    name = params[:name]
    # number = guest.phone_number
    store_notification(@message, '', name)
    # raise
    # send_message(message, number)
    # raise
    redirect_to '/notifications', notice: "Message sent to #{name}!"
  end

  def index
    @guests = Guest.all
    @notifications = Notification.all
  end

end
