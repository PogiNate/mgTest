require 'sinatra'
require 'data_mapper'
require 'sinatra/json'
require './models/email'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/mgTest.db")

get '/' do
  'Welcome to Arriving Faclon. This app is meant to be used as an API endpoint.'
end

get '/email' do
# do something useful here.
  json Email.first
end
# Save some email data. We'll get more complete soon enough.
post '/email' do
  newEmail = Email.new
  newEmail.sender = params[:sender]
  newEmail.subject = params[:subject]
  newEmail.body = params[:body]
  newEmail.save!
end
