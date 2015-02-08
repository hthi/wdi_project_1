require 'rails_helper'

RSpec.describe DetailsController do

  patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')
  appointment = patient.appointments.create(date: '2014-12-12', time: '10:00', provider_name: 'Dr. Kim')

  let(:valid_attributes) {
    { assessments: 'ECGs', duration: '40 min', add_notes: 'arrive 15min early'}
  }

    let(:invalid_attributes) {
    { assessments: nil, duration: nil, add_notes: nil}
  }

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new, appointment_id: appointment.id
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new, appointment_id: appointment.id
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'with valid_attributes'
      it 'saves a new detail' do
        expect {
          post :create, detail: valid_attributes, patient_id: appointment.patient_id, appointment_id: appointment.id
        }.to change(Detail, :count).by 1
      end

      it 'assigns @detail' do
        post :create, detail: valid_attributes, patient_id: appointment.patient_id, appointment_id: appointment.id
        expect(assigns(:detail)).to be_a Detail
        expect(assigns(:detail)).to be_persisted
      end

    context 'with invalid_attributes' do
      it 'assigns @detail, but does not save a new detail' do
        post :create, detail: invalid_attributes, patient_id: appointment.patient_id, appointment_id: appointment.id
        expect(assigns(:detail)).to be_a_new Detail
      end

      it 're-renders the new template' do
        post :create, detail: invalid_attributes, patient_id: appointment.patient_id, appointment_id: appointment.id
        expect(response).to render_template 'new'
      end
    end
  end
end
