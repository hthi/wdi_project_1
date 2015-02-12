require 'rails_helper'

RSpec.feature 'Managing patients' do

  before(:each) do
    User.create!(email: 'testemail@email.com', password: 'fakepassword')

    visit '/users/sign_in'
    fill_in 'Email', with: 'testemail@email.com'
    fill_in 'Password', with: 'fakepassword'

    click_on 'Log in'
  end
  scenario 'List all patients' do
  Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
  Patient.create!(name: 'Alexandra Parker', dob: '1972-05-18', mrn: '252-37-02', email: 'ally_p@yahoo.com')
  Patient.create!(name: 'Alice Chen', dob: '1960-06-22', mrn: '534-98-07', email: 'AC22@gmail.com')

    visit '/patients'

    expect(page).to have_content 'Patients'
    expect(page).to have_selector 'tr.patient', count: 3
  end

  scenario 'Create a patient' do
    visit '/patients/new'

    fill_in 'Name', with: 'Kevin Smith'
    fill_in 'Date of Birth', with: '1952-02-12'
    fill_in 'Medical Record Number', with: '523-66-71'
    fill_in 'Email', with: 'ksmith@gmail.com'

    expect(page).to have_content(/success/i)
  end

  scenario 'Show a patient' do
    patient = Patient.create!(name: 'Alexandra Parker', dob: '1972-05-18', mrn: '252-37-02', email: 'ally_p@yahoo.com')

    visit "/patients/#{patient.id}"

    expect((page).find('h2.patient')).to have_content 'Alexandra Parker'
  end

  scenario 'Update a patient' do
    patient = Patient.create!(name: 'Alice Chen', dob: '1960-06-22', mrn: '534-98-07', email: 'AC22@gmail.com')

    visit "patients/#{patient.id}/edit"

    fill_in 'Name', with: 'Alice Chen'
    fill_in 'Date of Birth', with: '1960-06-22'
    fill_in 'Medical Record Number', with: '534-98-07'
    fill_in 'Email', with: 'AC22@gmail.com'

    expect(page).to have_content(/success/i)
    expect((page).find('h1.edit_patient')).to have_content 'Edit Patient Information'
  end

  scenario 'Delete a patient' do
    patient = Patient.create!(name: 'Alexandra Parker', dob: '1972-05-18', mrn: '252-37-02', email: 'ally_p@yahoo.com')

    visit "patients/#{patient.id}/edit"

    click_on 'Delete Patient'

    expect(page).to have_content(/success/i)
  end

end
