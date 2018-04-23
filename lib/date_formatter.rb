# DateFormatter class to format the current date as dd-mm-yyyy
class DateFormatter
  def format_date
    today = Time.now
    today.split(' ').first.split('-').reverse.join('-')
  end
end
