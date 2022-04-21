class ReportSearchDate
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = parsed_date(params[:date_from], 7.days.ago.to_date.to_s)
    @date_to = parsed_date(params[:date_to], Date.today)
  end

  #filter based on range date
  def filter_date
    Order.where('created_at BETWEEN ? AND ?', @date_from, @date_to + 1.day)
  end

  private
  #parsed input to date
  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
end