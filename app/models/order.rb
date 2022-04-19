class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :delete_all
  has_many :menus, through: :order_details
  accepts_nested_attributes_for :order_details

  after_initialize :set_status

  def set_status()
    self.status ||= "NEW"
    
    time_now = Time.zone.now
    time_max = Time.zone.parse("17:00")
    
    if time_now >= time_max
      if self.status != "PAID"
        self.status = "CANCELED"
      end
    end
  end
end
