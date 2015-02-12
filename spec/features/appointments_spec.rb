require 'rails_helper'

RSpec.feature 'Managing Appointments' do

  before(:each) do
    User.create!(email: 'testemail@email.com', password: 'fakepassword')

    visit '/users/sign_in'
    fill_in 'Email', with: 'testemail@email.com'
    fill_in 'Password', with: 'fakepassword'

    click_on 'Log in'
  end


  scenario 'List all appointments for a patient' do
    patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')


    patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    patient.appointments.create!(date: '2014-12-12', time: '10:00', provider_name: 'Dr. Kim')
    patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Doyle, NP')

    visit "/patients/#{patient.id}"
    expect(page).to have_content 'Appointments'
    expect(page).to have_selector 'tr.appointment', count: 3
  end

  scenario 'Show an appointment' do
     patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    visit "/patients/#{patient.id}/appointments/#{appointment.id}"

    expect(page.find('h2.appt')).to have_content 'Appointment'
  end

  scenario 'Create an appointment' do
    patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')
    visit "/patients/#{patient.id}/appointments/new"

    fill_in 'Date', with: '2014-12-12'
    fill_in 'Time', with: '13:00'
    fill_in 'Provider', with: 'Dr. Flynt'


    click_on 'Create Appointment'
    visit "/patients/#{patient.id}"
    expect(page).to have_content(/success/i)
  end

  scenario 'Update a appointment' do
     patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')

    visit "patients/#{patient.id}/appointments/#{appointment.id}/edit"

    fill_in 'Date', with: '2014-12-12'
    fill_in 'Time', with: '13:00'
    fill_in 'Provider', with: 'Dr. Flynt'

    expect(page).to have_content(/success/i)
    expect(page.find('h1.edit_appt')).to have_content 'Edit Appointment'
  end

  scenario 'Delete an appointment' do
     patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create!(date: '2015-02-25', time: '13:00', provider_name: 'Dr. Flynt')

    visit "patients/#{patient.id}/appointments/#{appointment.id}/edit"

    click_on 'Delete Appointment'

    expect(page).to have_content(/success/i)
  end

end
