require 'dotenv/load'

class ApplicationController < ActionController::Base
  include Clearance::Controller

  def send_message(msg, number)
    @twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    # message = @client.api.messages.create(
      :from => @twilio_number,
      # :to => self.phone_number,
      :to => number,
      :body => msg,
      # :media_url => image_url
    )
    puts message.to
  end

  def store_notification(message, guest, name)
  # def store_notification(message, _options = {})
    @notification = Notification.new
    @notification.message = message
    temp = Guest.find(1)
    @notification.guest = guest == "" ? temp : guest
    @notification.sent_to = name == "" ? "" : name
    # @notification.guest = guest
    @notification.user = current_user
    # @notification.reason = 'unknown'
    @notification.save
    # raise
  end

end
