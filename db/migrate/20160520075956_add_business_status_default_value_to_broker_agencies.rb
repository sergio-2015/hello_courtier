class AddBusinessStatusDefaultValueToBrokerAgencies < ActiveRecord::Migration
  def up
    change_column_default :broker_agencies, :business_status, 'none'
  end

  def down
    change_column_default :broker_agencies, :business_status, nil
  end
end
