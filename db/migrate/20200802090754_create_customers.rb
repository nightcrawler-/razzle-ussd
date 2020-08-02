class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :national_id

      t.timestamps
    end
  end
end
