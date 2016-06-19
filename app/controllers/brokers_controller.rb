class BrokersController < ApplicationController

  def broker_management_page
    @broker = current_broker
    @broker_agency = BrokerAgency.new
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
