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
  end
end
