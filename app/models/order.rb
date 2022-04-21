class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :delete_all
  has_many :menus, through: :order_details
  accepts_nested_attributes_for :order_details

  before_save :set_status, :calculate_total
  after_find :update_status

  #automatically when create new order the status will be 'NEW'
  def set_status
    self.status ||= "NEW"
  end

  #To update status automatically if the time is more than 17:00
  def update_status
    time_now = Time.zone.now
    time_max = Time.zone.parse("17:00")
    
    if time_now >= time_max
      if self.status == "NEW"
        self.status = "CANCELED"
        save!
      end
    end
  end

  #calcute for total price in order
  def calculate_total
    self.total = 0.0
    order_details.each do |order_detail|
      self.total += order_detail.menu.price * order_detail.quantity
    end
  end

  #to search based on customer email in report
  def self.search_customer(search)
    joins(:customer).where(["customers.email like ?",search])
  end
  
end
