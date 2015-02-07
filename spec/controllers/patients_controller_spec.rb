require 'rails_helper'

RSpec.describe PatientsController do
  let(:valid_attributes) {
    { name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com'}
  }

  let(:invalid_attributes) {
    { name: nil, dob: nil, mrn: nil, email: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @patients' do
      patients = Patient.all
      get :index
      expect(assigns(:patients)).to eq patients
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      patient = Patient.create!(valid_attributes)
      get :show, id: patient
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      patient = Patient.create!(valid_attributes)
      get :show, id: patient
      expect(response).to render_template('show')
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      patient = Patient.create!(valid_attributes)
      get :edit, id: patient
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      patient = Patient.create!(valid_attributes)
      get :edit, id: patient
      expect(response).to render_template('edit')
    end

    it 'assigns @patient' do
      patient = Patient.create!(valid_attributes)
      get :edit, id: patient
      expect(assigns(:patient)).to eq patient
    end
  end

  describe 'PATCH update' do
    context 'with valid_attributes' do
      let(:new_attributes) {
        { name: 'Alice Chen', dob: '1960-06-22', mrn: '534-98-07', email: 'AC22@gmail.com' }
      }

      it 'updates the requested patient' do
        patient = Patient.create!(valid_attributes)
        patch :update, id: patient, patient: new_attributes
        patient.reload
        expect(patient.name).to eq new_attributes[:name]
      end

      it 'assigns @patient' do
        patient = Patient.create!(valid_attributes)
        patch :update, id: patient, patient: new_attributes
        expect(assigns(:patient)).to eq patient
      end

      it 'redirects to the patient' do
        patient = Patient.create!(valid_attributes)
        patch :update, id: patient, patient: new_attributes
        expect(response).to redirect_to patient
      end
    end

    context 'with invalid attributes' do
      it 'assigns @patient' do
        patient = Patient.create!(valid_attributes)
        patch :update, id: patient, patient: invalid_attributes
        expect(assigns(:patient)).to eq patient
      end

      it 're-renders the edit template' do
        patient = Patient.create!(valid_attributes)
        patch :update, id: patient, patient: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested patient entry' do
      patient = Patient.create!(valid_attributes)
      expect { delete :destroy,
        id: patient}.to change(Patient, :count).by(-1)
     end

    it 'redirects to the patient list' do
       patient = Patient.create!(valid_attributes)
       delete :destroy, id: patient
     expect(response).to redirect_to patients_url
    end
  end
end

