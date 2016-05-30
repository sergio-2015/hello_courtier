class PagesController < ApplicationController
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
