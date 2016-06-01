class PagesController < ApplicationController
  include ExpertiseAreas
  before_action :set_user_wishes_to_expertise_correspondance, only: :home

  def home
    random_agency_cards
  end
end

private

def random_agency_cards
   broker_agencies = BrokerAgency.all
   @sample_of_agencies = broker_agencies.sample(4)
   return @sample_of_agencies
end
