class AddPatientIdToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :patient, index: true
    add_foreign_key :appointments, :patients
  end
end
