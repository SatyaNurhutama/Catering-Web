class ReportController < ApplicationController
  def index
    @orders = Order.all
  end

  def date
    @search = ReportSearchDate.new(params[:search])
    @orders = @search.filter_date
  end

  def email
    @orders = Order.search_customer(params[:search])
  end

end
