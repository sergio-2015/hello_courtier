class BrokerAgenciesController < ApplicationController
  include ExpertiseAreas

  skip_before_action :authenticate_person!, only: [:index, :show]
  before_action :set_broker_agency, only: [:show]
  before_action :set_all_broker_agencies, :set_user_wishes_to_expertise_correspondance, :set_expertise_wanted_by_user, only: [:index]

  def index
    @result_agencies = BrokerAgency.joins(:broker_agency_expertises).where(broker_agency_expertises: { expertise_id: @expertise_wanted })
    set_geographic_search
    set_final_list

    @markers = Gmaps4rails.build_markers(@final_results) do |agency, marker|
      marker.lat agency.latitude
      marker.lng agency.longitude
    end

  end

  def show
    # @alert_message = "Bienvenu sur la fiche de #{@broker_agency.name}"
    @broker_agency_coordinates = { latitude: @broker_agency.latitude, longitude: @broker_agency.longitude }
  end

  def new
    @new_agency = BrokerAgency.new
  end

  def create
    @new_agency = BrokerAgency.new(broker_agency_params)
    @new_agency.broker = current_broker
    @new_agency.business_status = "free"
    if @new_agency.save
      @new_agency.complete_adress = @new_agency.street + " " + @new_agency.zipcode + " " + @new_agency.city
      @new_agency.save

      @new_agency.broker_agency_expertises.create(expertise_id: @new_agency.expertise_id_1, broker_agency_id: @new_agency.id)
      @new_agency.broker_agency_expertises.create(expertise_id: @new_agency.expertise_id_2, broker_agency_id: @new_agency.id)
      @new_agency.broker_agency_expertises.create(expertise_id: @new_agency.expertise_id_3, broker_agency_id: @new_agency.id)
      @new_agency.broker_agency_expertises.create(expertise_id: @new_agency.expertise_id_4, broker_agency_id: @new_agency.id)

      # @new_agency.broker_agency_expertises.create(expertise_id: @new_agency.expertise_ids, broker_agency_id: @new_agency.id)

      redirect_to broker_management_page_path, notice: 'Votre agence a été enregistrée avec succès'
    else
      raise # attention, mettre redirection vers new
    end
  end


  private

  def broker_agency_params
    params.require(:broker_agency).permit(:name, :phone_number, :email, :website, :twitter_account, :facebook_account, :linkedin_account, :street, :zipcode, :city, :creation_year, :siret, :description, :expertise_id_1, :expertise_id_2, :expertise_id_3, :expertise_id_4)  #  , :expertise_id_1, :expertise_id_2, :expertise_id_3, :expertise_id_4     broker_agency_expertises_attributes: [:broker_agency_id], expertise_attributes: [:id]
  end

  def set_all_broker_agencies
    @broker_agencies = BrokerAgency.all
  end

  def set_broker_agency
    @broker_agency = BrokerAgency.find(params[:id])
  end

  def set_geographic_search
    @departement = []
    @villes = []
    lieu_input = params[:lieu]

    if lieu_input == nil || lieu_input == ""
      @departement = BrokerAgency.all.pluck(:zipcode)
      @departement.map! do |dept|
        dept.length > 2 ? dept.slice!(0..1) : dept
      end
      @departement.uniq!
    # elsif params[:lieu].is_a? Numeric
    elsif /\A[-+]?\d*\.?\d+\z/.match(lieu_input)
      @departement << lieu_input.slice(0..1)

      # @departement.map! do |dept|
      #   dept.length > 2 ? dept.slice!(0..1) : dept
      # end
    # elsif params[:cities] != nil || params[:cities] != []
    #   params[:cities].each do |city|
    #     @villes << city
    #   end
    else
      @villes << lieu_input
    end
  end

  def set_final_list
    if @departement == []
      selected_town = @villes.first.upcase
      if @result_agencies.where(city: selected_town) == []
        @final_results = @result_agencies
      else
        @final_results = @result_agencies.where(city: selected_town)
      end


    elsif @villes == []
      @zipcodes_to_check = []
      list_of_zipcodes = BrokerAgency.all.pluck(:zipcode).uniq!
      list_of_zipcodes.each do |zipcode|
        departement = zipcode.slice(0..1)
        if @departement.include? departement
          @zipcodes_to_check << zipcode
        end
      end

      @final_results = @result_agencies.where(zipcode: @zipcodes_to_check)

    end
  end


end



