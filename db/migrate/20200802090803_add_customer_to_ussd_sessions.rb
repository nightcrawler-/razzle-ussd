class AddCustomerToUssdSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :ussd_sessions, :customer_id, :bigint
  end
end
