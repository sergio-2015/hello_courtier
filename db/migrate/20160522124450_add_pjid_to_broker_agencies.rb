class AddPjidToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :pjid, :string
  end
end
