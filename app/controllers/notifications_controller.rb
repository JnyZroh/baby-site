class NotificationsController < ApplicationController
  before_action :require_login, only: [:index, :new]

  def new
    @message = params[:message]
    number = params[:number]
    name = params[:name]
    sid = send_message(@message, number)
    store_notification(@message, '', name, sid)
    redirect_to '/notifications', notice: "Message sent to #{name}!"
  end

  def index
    @guests = Guest.all
    @notifications = Notification.all

    @twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
