module BrokerAgenciesHelper

  def cities_for_search(broker_agencies)
    @cities_for_search = []
    all_cities_in_results = broker_agencies.pluck(:city).uniq
    all_cities_in_results.each do |city|
      nb_agencies = BrokerAgency.where(city: city).count
      @cities_for_search << [city, nb_agencies]
    end
    return @cities_for_search
  end


end
