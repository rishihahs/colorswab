module ApplicationHelper
  def copyright(year)
    @now ||= Time.new.year
    if year < @now
      "#{year}-#{@now}"
    else
      "#{year}"
    end
  end
end
