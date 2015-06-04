require 'sinatra'
require 'data_mapper'
require 'sinatra/json'
require './models/email'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/mgTest.db")

get '/' do
  'Welcome to Arriving Faclon. This app is meant to be used as an API endpoint.'
end

get '/email/:id' do
# do something useful here.
  json Email.get(params['id'])
end

get '/inbox' do
  json Email.all
end
# Save some email data. We'll get more complete soon enough.
post '/email' do
  new_email = Email.new
  new_email.sender = params[:sender]
  new_email.subject = params[:subject]
  new_email.body = params[:body]
  new_email.save!
end
