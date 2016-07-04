class AddDescriptionToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :description, :text, limit: 2500
  end
end
