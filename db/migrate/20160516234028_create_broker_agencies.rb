class CreateBrokerAgencies < ActiveRecord::Migration
  def change
    create_table :broker_agencies do |t|
      t.references :broker, index: true, foreign_key: true
      t.string :business_status
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :twitter_account
      t.string :facebook_account
      t.string :linkedin_account
      t.string :street
      t.string :zipcode
      t.string :city
      t.integer :creation_year

      t.timestamps null: false
    end
  end
end
