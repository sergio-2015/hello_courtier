module ExpertiseAreas

  def set_user_wishes_to_expertise_correspondance
    @user_wishes = ["acheter un logement", "construire un logement", "faire des travaux", "renégocier mon prêt immobilier", "réaliser un rachat de crédits", "réaliser un investissement locatif"]
  end

  def set_expertise_wanted_by_user
    if params[:projet] == nil || params[:projet] == ""
      @expertise_wanted = Expertise.all.pluck(:id)
    elsif params[:projet] == "acheter un logement" || params[:projet] == "construire un logement" || params[:projet] == "faire des travaux"
      @expertise_wanted = Expertise.find_by_name("Crédit immobilier").id
    elsif params[:projet] == "renégocier mon prêt immobilier"
      @expertise_wanted = Expertise.find_by_name("Renégociation de crédit").id
    elsif params[:projet] == "réaliser un rachat de crédits"
      @expertise_wanted = Expertise.find_by_name("Rachat de crédits").id
    elsif params[:projet] == "réaliser un investissement locatif"
      @expertise_wanted = Expertise.find_by_name("Investissement locatif").id
    end
  end

end
