class ReportController < ApplicationController
  def index
    @orders = Order.all
  end

  def date
    @orders = Order.where(created_at: (Date.today - 7.days)..Date.today)
  end
end
