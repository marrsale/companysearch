class CreateCompanyOfficers < ActiveRecord::Migration[5.0]
  def change
    create_table :company_officers do |t|
      t.string :name
      t.text :raw_data
      t.references :company

      t.timestamps
    end
  end
end
