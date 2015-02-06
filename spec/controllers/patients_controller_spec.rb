require 'rails_helper'

RSpec.describe PatientsController do
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
end
