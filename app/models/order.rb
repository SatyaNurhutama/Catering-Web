class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :delete_all
  has_many :menus, through: :order_details
  accepts_nested_attributes_for :order_details

  after_initialize :set_status
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
  
end
