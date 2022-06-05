class ApplicationMailer < ActionMailer::Base
# First, instantiate the Mailgun Client with your API key
  default from: "kkw3401@gmail.com" 
  layout  'mailer'
end
