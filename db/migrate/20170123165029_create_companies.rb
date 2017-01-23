class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.string :remote_number
      t.string :address
      t.text :raw_data

      t.timestamps
    end
  end
end
