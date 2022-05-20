require 'twilio-ruby'
require 'dotenv/load'

class SendSms
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end
  end

  # def execute!
  # def execute!(**args)
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: 'Hello there!',
      to: ENV['MY_NUMBER'],
      from: ENV['TWILIO_NUMBER']
    )
    puts message.sid
  # end

  # puts execute!
end
