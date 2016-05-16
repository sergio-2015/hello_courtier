class BrokerAgency < ActiveRecord::Base
  belongs_to :broker

  validates :broker_id, :business_status, :name, :phone_number, :street, :zipcode, :city, presence: true
end
