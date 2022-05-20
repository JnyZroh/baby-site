class NotificationsController < ApplicationController
  before_action :require_login, only: [:index, :new]

  def new
    @message = params[:message]
    number = params[:number]
    name = params[:name]
    store_notification(@message, '', name)
    send_message(@message, number)
    redirect_to '/notifications', notice: "Message sent to #{name}!"
  end

  def index
    @guests = Guest.all
    @notifications = Notification.all
  end

end
