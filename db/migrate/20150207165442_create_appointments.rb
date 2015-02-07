class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :time
      t.string :provider_name

      t.timestamps null: false
    end
  end
end
