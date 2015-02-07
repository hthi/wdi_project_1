require 'rails_helper'

RSpec.feature 'Managing Appointments' do
  # let(:patient) {
  #   { name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com' }
  # }

  patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')

  scenario 'List all appointments for a patient' do
    patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    patient.appointments.create!(date: '2014-12-12', time: '10:00', provider_name: 'Dr. Kim')
    patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Doyle, NP')

    visit "/patients/#{patient.id}"
    expect(page).to have_content 'Appointments'
    expect(page).to have_selector 'div', count: 3
  end

  scenario 'Show an appointment' do
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    visit "/patients/#{patient.id}/appointments/#{appointment.id}"

    expect(page.find('h1')).to have_content 'Appointment'
  end

end
