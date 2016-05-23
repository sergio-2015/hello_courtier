class BrokerAgency < ActiveRecord::Base
  belongs_to :broker

  validates :broker_id, :business_status, :name, :phone_number, :street, :zipcode, :city, presence: true

  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_format_of :phone_number, :with => /\A0[0-9]([-. ]?\d{2}){4}[-. ]?\z/
  validates_format_of :website, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/
  # validates_format_of :twitter_account, :with => /\A([a-zA-Z](_?[a-zA-Z0-9]+)*_?|_([a-zA-Z0-9]+_?)*)\z/
  validates_format_of :zipcode, with: /\A[0-9]{5}\z/
end
