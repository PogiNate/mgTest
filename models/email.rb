require 'dm-core'
require 'dm-migrations'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/mgTest.db")

class Email
  include DataMapper::Resource
  property :id, Serial
  property :sender, String
  property :body, Text
  property :ccRecipients, Text
  property :bccRecipients, Text
  property :subject, String
  property :to, Text
  property :recipient, String
end



