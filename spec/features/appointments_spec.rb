require 'rails_helper'

RSpec.feature 'Managing Appointments' do

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

  scenario 'Create an appointment' do
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    visit "/patients/#{patient.id}/appointments/new"

    fill_in 'Date', with: '2014-12-12'
    fill_in 'Time', with: '13:00'
    fill_in 'Provider', with: 'Dr. Flynt'

    click_on 'Create Appointment'
    expect(page).to have_content(/success/i)
  end

  scenario 'Update a appointment' do
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')

    visit "patients/#{patient.id}/appointments/#{appointment.id}/edit"

    fill_in 'Date', with: '2014-12-12'
    fill_in 'Time', with: '13:00'
    fill_in 'Provider', with: 'Dr. Flynt'

    expect(page).to have_content(/success/i)
    expect(page.find('h1')).to have_content 'Edit Appointment Details'
  end

  scenario 'Delete an appointment' do
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')

    visit "patients/#{patient.id}/appointments/#{appointment.id}/edit"

    click_on 'Delete Appointment'

    expect(page).to have_content(/success/i)
  end

end
