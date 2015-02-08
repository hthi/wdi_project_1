class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :assessments
      t.string :duration
      t.string :add_notes
      t.belongs_to :appointment, index: true

      t.timestamps null: false
    end
    add_foreign_key :details, :appointments
  end
end
