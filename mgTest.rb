require 'sinatra'
require 'data_mapper'
require 'sinatra/json'
require './models/email'
require './helpers/mailgun_helper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/mgTest.db")

get '/' do
  'Welcome to Arriving Falcon. This app is meant to be used as an API endpoint.'
end

get '/inbox/:id' do
  json Email.get(params['id'])
end

get '/inbox' do
  json Email.all
end
# Save some email data. We'll get more complete soon enough.
post '/inbox' do
  new_email = Email.new
  new_email.sender = params[:sender]
  new_email.to = params[:To]
  new_email.subject = params[:subject]
  new_email.body = params["body-plain"]
  new_email.ccRecipients = params[:Cc]
  new_email.recipient = params[:recipient]
  new_email.save!
end

# Send something!
post '/outbox' do
  to_send         = Email.new
  to_send.to      = params[:to]
  to_send.sender  = params[:from]
  to_send.subject = params[:subject]
  to_send.body    = params[:body]

  send_message to_send
end

#send the default test message.
get '/outbox' do
  send_default_message
end

