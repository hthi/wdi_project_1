require 'rails_helper'

RSpec.feature 'Managing Details' do

  before(:each) do
    User.create!(email: 'testemail@email.com', password: 'fakepassword')

    visit '/users/sign_in'
    fill_in 'Email', with: 'testemail@email.com'
    fill_in 'Password', with: 'fakepassword'

    click_on 'Log in'
  end

  scenario 'List all details for an appointment' do
    patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create(date: '2014-12-12', time: '10:00', provider_name: 'Dr. Kim')
    appointment.details.create!(assessments: 'PE, vitals, ECGs', duration: '8 hours', add_notes: 'please fast overnight' )
    appointment.details.create!(assessments: 'PE, blood draws', duration: '6 hours', add_notes: 'please arrange for transportation home' )
    appointment.details.create!(assessments: 'PE', duration: '3 hours', add_notes: 'please eat visit' )

    visit "patients/#{patient.id}/appointments/#{appointment.id}"
    expect(page).to have_content 'Details'
  end

  scenario 'Delete a detail' do
    patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
    appointment = patient.appointments.create(date: '2014-12-12', time: '10:00', provider_name: 'Dr. Kim')
    detail = appointment.details.create!(assessments: 'PE, blood draws', duration: '6 hours', add_notes: 'please arrange for transportation home')

    visit "patients/#{patient.id}/appointments/#{appointment.id}"
  end
end
