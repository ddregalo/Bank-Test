# frozen_string_literal: true

# DateFormatter class to format the current date as dd-mm-yyyy
class DateFormatter
  def format_date
    today = Time.now.to_s
    today.split(' ').first.split('-').reverse.join('/')
  end
end
