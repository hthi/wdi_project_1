class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :mrn
      t.string :email

      t.timestamps null: false
    end
  end
end
