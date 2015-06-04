require 'sinatra/base'
require './models/email'
require 'rest-client'

module Sinatra
  module Mailgun
    def send_message (to_send)
      if to_send.class == Email
        RestClient.post ENV['MG_CONNECT_STRING'],
            :from        => to_send.sender,
            :to          => to_send.to,
            :subject     => to_send.subject,
            :text        => to_send.body,
            'o:testmode' => ENV['TEST_MODE']== 'TRUE' ? true : false
      end
    end
    def send_default_message
      connect_string = "#{ENV['MG_CONNECT_STRING']}"
      result = RestClient.post connect_string,
          :from        =>'Testing Mailgun<first_test_man@coals2newcastle.com>',
          :to          => "#{ENV['DEFAULT_TO']}",
          :subject     =>"Hey there! Good Testin'!",
          :text        => 'This is a big ol\' email to let you know that you\'re using Mailgun appropriately. I hope you enjoy this email!',
          'o:testmode' => ENV['TEST_MODE']=='TRUE' ? true : false
      result
    end
  end
  helpers Mailgun
end