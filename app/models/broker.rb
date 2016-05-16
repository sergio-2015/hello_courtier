class Broker < ActiveRecord::Base
  has_many :broker_agencies

  validates :first_name, :last_name, :email, :phone_number, presence: true, unless: :new_record?
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_format_of :phone_number, :with => /\A0[0-9]([-. ]?\d{2}){4}[-. ]?\z/

end
