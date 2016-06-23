class BrokerAgencyExpertise < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :broker_agency

  validates_presence_of :broker_agency_id, allow_nil: false
  validates_presence_of :expertise_id, allow_nil: false
  validates_uniqueness_of :broker_agency_id, scope: :expertise_id
end
