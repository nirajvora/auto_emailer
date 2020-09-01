require 'net/smtp'
require 'yaml'
require 'erb'

class InfluencerEmail
  attr_reader :page
  attr_reader :email

  def initialize(identity, email_template)
    @name = identity['name'] || ''
    @email = identity['email']
    @page = identity['page']
    @email_template = email_template
    @email_config = YAML.load_file('../config/email_config.yml')
  end

  def send
    Net::SMTP.start(@email_config['mail_server'],
                    587,
                    'localhost',
                    @email_config['email'],
                    @email_config['password'],
                    :plain) do |smtp|
      smtp.sendmail(mailtext(@email_template), @email_config['email'], [@email])
    end
  end

  private

  def marker
    'AUNIQUEMARKER'
  end

  def mailtext(email_template)
    ERB.new(email_template).result(binding)
  end
end
