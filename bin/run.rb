require_relative '../lib/email_collection.rb'

error_message = <<~EOF
  You must provide exactly 2 arguments.
  Argument 1: path to csv file
  Argument 2: path to template

  example:
  user@path]$ ruby run.rb ../data/sample.csv ../templates/youtube.erb
EOF

abort(error_message) if ARGV.length != 2

filepath = ARGV[0]
templatepath = ARGV[1]

email_collection = EmailCollection.new(filepath, templatepath)

email_collection.email_targets.each do |email|
  email.send
end
