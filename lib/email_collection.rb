require_relative 'influencer_email'
require 'csv'

class EmailCollection
  attr_reader :email_targets

  def initialize(csvpath, templatepath)
    csv_contents = CSV.read(csvpath)
    keys = csv_contents.shift.map(&:downcase)
    @email_targets = csv_contents.map do |identity|
      InfluencerEmail.new(Hash[keys.zip(identity)], formated_template(templatepath))
    end
  end

  def formated_template(templatepath)
    headers = File.read('../templates/headers.erb')
    body = File.read(templatepath)
    headers + body
  end
end
