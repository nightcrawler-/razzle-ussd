class CreateUssdSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :ussd_sessions do |t|
      t.string :session_id
      t.string :phone_number
      t.string :network_code
      t.string :service_code
      t.text :text

      t.timestamps
    end
  end
end
