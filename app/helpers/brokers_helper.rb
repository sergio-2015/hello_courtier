module BrokersHelper


  def resource_name
    :broker
  end

  def resource
    @resource ||= Broker.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:broker]
  end




end
