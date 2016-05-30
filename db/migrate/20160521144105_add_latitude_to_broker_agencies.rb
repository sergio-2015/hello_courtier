class AddLatitudeToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :latitude, :float
  end
end
