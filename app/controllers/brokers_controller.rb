class BrokersController < ApplicationController

  def broker_management_page
    @broker = current_broker
    @new_agency = BrokerAgency.new
    @expertises = Expertise.all
    @broker_agencies = current_broker.broker_agencies


    @markers = Gmaps4rails.build_markers(@broker_agencies) do |agency, marker|
      marker.lat agency.latitude
      marker.lng agency.longitude
    end

  end

  def update_password
    @broker = Broker.find(current_broker.id)
    if @broker.update(broker_params)
      sign_in :broker, @broker, bypass: true
      redirect_to broker_management_page_path, notice: 'Votre mot de passe a été modifié avec succès'
    else
      render "edit"
    end
  end


  private

  def broker_params
    params.require(:broker).permit(:password, :password_confirmation)
  end

end
