class AddLongitudeToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :longitude, :float
  end
end
