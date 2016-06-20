class BrokersController < ApplicationController

  # before_action :set_broker_agency, only: [:broker_management_page]

  def broker_management_page
    @broker = current_broker
    @new_agency = BrokerAgency.new
    @broker_agencies = current_broker.broker_agencies
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

  # def set_broker_agency
  #   @broker_agencies = BrokerAgency.find(current_broker.broker_agencies.id)
  # end

end
