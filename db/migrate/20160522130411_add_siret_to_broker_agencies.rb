class AddSiretToBrokerAgencies < ActiveRecord::Migration
  def change
    add_column :broker_agencies, :siret, :string
  end
end
