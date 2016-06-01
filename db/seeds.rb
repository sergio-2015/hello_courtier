# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BrokerAgencyExpertise.destroy_all
Expertise.destroy_all


expertises = ["Crédit immobilier", "Renégociation de crédit", "Rachat de crédits", "Investissement locatif"]

expertises.each do |exp|
  a = Expertise.new
  a.name = exp
  a.save
end


agencies = BrokerAgency.all
agencies.each do |agency|

  all_expertise_ids = Expertise.all.pluck(:id)

  a = BrokerAgencyExpertise.new
  a.broker_agency_id = agency.id
  a.expertise_id = all_expertise_ids.sample
  a.save

  all_expertise_ids.delete(a.expertise_id)

  b = BrokerAgencyExpertise.new
  b.broker_agency_id = agency.id
  b.expertise_id = all_expertise_ids.sample
  b.save

end

