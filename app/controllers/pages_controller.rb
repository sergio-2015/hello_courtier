class PagesController < ApplicationController
  include ExpertiseAreas
  skip_before_action :authenticate_person!, only: [:home, :devenir_partenaire]
  before_action :set_user_wishes_to_expertise_correspondance, only: :home

  def home
    random_agency_cards

  end

  def devenir_partenaire
  end




end

private

def random_agency_cards
   broker_agencies = BrokerAgency.all
   @sample_of_agencies = broker_agencies.sample(4)
   return @sample_of_agencies
end
