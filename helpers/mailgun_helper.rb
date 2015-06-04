require 'sinatra/base'
require '../models/email'
require 'rest-client'

module Sinatra
  module Mailgun
    def send_message (to_send)
      if to_send.class == Email

      end
    end
    def send_default_message
      RestClient.post "https://#{ENV['MG_API_KEY']}#{ENV['MG_PATH']}",
          :from =>'',
          :to=>'',
    end
  end
  helpers Mailgun
end