require 'rails_helper'

RSpec.describe AppointmentsController do
   patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')

   let(:appt_valid_attributes) {
    { date: '2015-02-25', time: '13:00', provider_name: 'Doyle, NP'}
  }

  describe 'GET show' do
    it 'has a 200 status code' do
      appointment = patient.appointments.create!(appt_valid_attributes)
      get :show, patient_id: patient.id, id: appointment.id
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      appointment = patient.appointments.create!(appt_valid_attributes)
      get :show, patient_id: patient.id, id: appointment.id
      expect(response).to render_template('show')
    end
  end

end


