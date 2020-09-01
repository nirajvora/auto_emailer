require 'action_mailer'

mailer = ActionMailer::Base.new

# check settings:
mailer.delivery_method = :smtp
mailer.smtp_settings = {
  address: 'auth.smtp.1and1.co.uk',
  domain: '1and1.com',
  port: 587,
  authentication: 'login',
  user_name: 'nivo@nuitsansf.in',
  password: 'b1gFAKT5!',
  enable_starttls_auto: true
}

# send mail:
mailer.mail(
  from: 'nivo@nuitsansf.in',
  to: 'nirajsvora@gmail.com',
  subject: 'test',
  body: "Hello, you've got mail!"
).deliver
