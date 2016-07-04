class Expertise < ActiveRecord::Base

  has_many :broker_agency_expertises, dependent: :destroy
  has_many :broker_agencies, through: :broker_agency_expertises

  accepts_nested_attributes_for :broker_agency_expertises, allow_destroy: true

end
