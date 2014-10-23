module CopyrightNoticesHelper
  def copyright_notice(start_year=Time.now.utc.year)
    end_year = Time.now.utc.year
    year_range = copyright_notice_year_range(start_year, end_year)
    "&copy; #{year_range} Toggle Professional Services LLC".html_safe
  end

private
  def copyright_notice_year_range(start_year, end_year)
    return "#{start_year}-#{end_year}" if start_year != end_year
    return "#{end_year}"
  end
end
