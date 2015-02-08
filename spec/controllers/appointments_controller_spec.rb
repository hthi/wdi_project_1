require 'rails_helper'

RSpec.describe AppointmentsController do

   patient = Patient.create!(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')

   let(:appt_valid_attributes) {
    { date: '2015-02-25', time: '13:00', provider_name: 'Doyle, NP'}
  }

    let(:appt_invalid_attributes) {
    { date: nil, time: nil, provider_name: nil}
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

    describe 'GET new' do
    it 'has a 200 status code' do
      get :new, patient_id: patient.id
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new, patient_id: patient.id
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'with valid attribute' do
      it 'saves a new appointment' do
        expect {
          post :create, appointment: appt_valid_attributes, patient_id: patient.id
        }.to change(Appointment, :count).by 1
      end

      it 'assigns @appointment' do
        post :create, appointment: appt_valid_attributes, patient_id: patient.id
        expect(assigns(:appointment)).to be_an Appointment
        expect(assigns(:appointment)).to be_persisted
      end

      it 'redirects to the created appointments' do
        post :create, appointment: appt_valid_attributes, patient_id: patient.id
        expect(response).to redirect_to patient_path(patient.id)
      end

    context 'with invalid attributes' do
      it 'assigns @appointment, but does not save a new appointment' do
        post :create, appointment: appt_invalid_attributes, patient_id: patient.id
        expect(assigns(:appointment)).to be_a_new Appointment
      end

      it 're-renders the new template' do
        post :create, appointment: appt_invalid_attributes, patient_id: patient.id
        expect(response).to render_template 'new'
       end
      end
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      appointment = patient.appointments.create!(appt_valid_attributes)
      get :edit, patient_id: patient.id, id: appointment.id
      expect(response.status).to eq 200
    end

     it 'renders the edit template' do
      appointment = patient.appointments.create!(appt_valid_attributes)
      get :edit, patient_id: patient.id, id: appointment.id
      expect(response).to render_template('edit')
    end

    it 'assigns @appointment' do
     appointment = patient.appointments.create!(appt_valid_attributes)
      get :edit, patient_id: patient.id, id: appointment.id
      expect(assigns(:appointment)).to eq appointment
    end
  end

  describe 'PATCH update' do
    context 'with valid_attributes' do
      let(:new_attributes) {
        { date: '2015-03-12', time: '9:00', provider_name: 'Flan, NP' }
      }

      it 'updates the requested appointment' do
        appointment = patient.appointments.create!(appt_valid_attributes)
        patch :update, patient_id: patient.id, id: appointment.id, appointment: new_attributes
        appointment.reload
        expect(appointment.time).to eq new_attributes[:time]
      end

      it 'assigns @appointments' do
        appointment = patient.appointments.create!(appt_valid_attributes)
        patch :update, patient_id: patient.id, id: appointment.id, appointment: new_attributes
        expect(assigns(:appointment)).to eq appointment
      end

      it 'redirects to the appointment' do
        appointment = patient.appointments.create!(appt_valid_attributes)
        patch :update, patient_id: patient.id, id: appointment.id, appointment: new_attributes
        expect(response).to redirect_to patient_path(patient)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @appointments' do
        appointment = patient.appointments.create!(appt_valid_attributes)
        patch :update, patient_id: patient.id, id: appointment.id, appointment: appt_invalid_attributes
        expect(assigns(:patient)).to eq patient
      end

      it 're-renders the edit template' do
        appointment = patient.appointments.create!(appt_valid_attributes)
        patch :update, patient_id: patient.id, id: appointment.id, appointment: appt_invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested appointment' do
      appointment = patient.appointments.create!(appt_valid_attributes)
      expect { delete :destroy,
        patient_id: patient.id, id: appointment.id}.to change(Appointment, :count).by(-1)
     end

    it 'redirects to the appointment list' do
       appointment = patient.appointments.create!(appt_valid_attributes)
       delete :destroy, patient_id: patient.id, id: appointment.id
     expect(response).to redirect_to patient_path(patient)
    end
  end


end


