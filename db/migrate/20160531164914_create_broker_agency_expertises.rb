class CreateBrokerAgencyExpertises < ActiveRecord::Migration
  def change
    create_table :broker_agency_expertises do |t|
      t.references :expertise, index: true, foreign_key: true
      t.references :broker_agency, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
