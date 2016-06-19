class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # devenir_partenaire_path
    broker_management_page_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    broker_management_page_path
  end



  private


end
