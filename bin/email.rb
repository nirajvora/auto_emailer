require 'net/smtp'

marker = 'AUNIQUEMARKER'
body = <<~EOF
  This is a test email to send an attachement.
EOF

# Define the main headers.
part1 = <<~EOF
  From: Private Person <nivo@nuitsansf.in>
  To: A Test User <nirajsvora@gmail.com>
  Subject: SMTP e-mail test
  MIME-Version: 1.0
  Content-Type: multipart/mixed; boundary = #{marker}
  --#{marker}
EOF

# Define the message action
part2 = <<~EOF
  Content-Type: text/plain
  Content-Transfer-Encoding:8bit
  
  #{body}
  --#{marker}
EOF

mailtext = part1 + part2

# Let's put our code in safe area
begin
  Net::SMTP.start('smtp.ionos.com',
                  587,
                  'localhost',
                  'nivo@nuitsansf.in',
                  'b1gFAKT5!',
                  :plain) do |smtp|
    smtp.sendmail(mailtext, 'nivo@nuitsansf.in', ['nirajsvora@gmail.com'])
  end
rescue Exception => e
  print 'Exception occured: ' + e
end
