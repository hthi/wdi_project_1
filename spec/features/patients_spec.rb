require 'rails_helper'

RSpec.feature 'Managing patients' do
  scenario 'List all patients' do
  Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
  Patient.create!(name: 'Alexandra Parker', dob: '1972-05-18', mrn: '252-37-02', email: 'ally_p@yahoo.com')
  Patient.create!(name: 'Alice Chen', dob: '1960-06-22', mrn: '534-98-07', email: 'AC22@gmail.com')

    visit '/patients'

    expect(page).to have_content 'Patients'
    expect(page).to have_selector 'li', count: 3
  end
end
