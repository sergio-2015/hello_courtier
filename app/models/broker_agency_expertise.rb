class BrokerAgencyExpertise < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :broker_agency

  validates_uniqueness_of :broker_agency_id, scope: :expertise_id
end
