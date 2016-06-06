class AddCompleteAdressToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :complete_adress, :string
  end
end
