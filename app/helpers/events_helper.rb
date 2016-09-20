module EventsHelper
  def formated_time(time)
    time.strftime("%I:%M %p")
  end

  def formated_date(date)
    date.strftime('%m/%d/%Y   %A')
  end
end
