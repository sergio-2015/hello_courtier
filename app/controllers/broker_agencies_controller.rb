class BrokerAgenciesController < ApplicationController
  include ExpertiseAreas

  before_action :set_broker_agency, only: [:show]
  before_action :set_all_broker_agencies, :set_user_wishes_to_expertise_correspondance, :set_expertise_wanted_by_user, only: [:index]

  def index
    set_geographic_search
    @result_agencies = BrokerAgency.joins(:broker_agency_expertises).where(broker_agency_expertises: { expertise_id: @expertise_wanted })
  end

  def show
  end

  private

  def set_all_broker_agencies
    @broker_agencies = BrokerAgency.all
  end

  def set_broker_agency
    @broker_agency = BrokerAgency.find(params[:id])
  end

  def set_geographic_search
    if params[:lieu] == nil || params[:lieu] == ""
      lieux = BrokerAgency.all.pluck(:zipcode)
    else
      lieux = []
      lieux << params[:lieu].to_s
    end
    lieux.map! do |lieu|
      lieu.length > 2 ? lieu.slice!(0..1) : lieu
    end
    lieux.uniq!
    # search_through_all_zipcodes(lieux)
  end

  # def search_through_all_zipcodes(lieux)
  #   zipcodes = @broker_agencies.pluck(:zipcode)
  #   lieux
  # end


end



