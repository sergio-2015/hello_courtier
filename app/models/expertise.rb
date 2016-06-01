class Expertise < ActiveRecord::Base

  has_many :broker_agency_expertises
  has_many :broker_agencies, through: :broker_agency_expertises

end
