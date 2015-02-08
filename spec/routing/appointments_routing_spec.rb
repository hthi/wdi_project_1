require 'rails_helper'

RSpec.describe 'routes for appointments' do
  it 'routes GET /patients/1/appoinments/new to the appointments controller' do
    expect(get('/patients/1/appointments/new')).to route_to(
      controller: "appointments",
      action: "new",
      patient_id: "1"
      )
  end

  it 'routes GET /patients/1/appoinments/1 to the appointments controller' do
  expect(get('/patients/1/appointments/1')).to route_to(
    controller: "appointments",
    action: "show",
    patient_id: "1",
    id: "1"
    )
  end

  it 'routes GET /patients/1/appointments/new to the appointments controller' do
    expect(get('/patients/1/appointments/new')).to route_to(
      controller: "appointments",
      action: "new",
      patient_id: "1"
      )
  end

  it 'routes POST /appointments to the appointments controller' do
    expect(post('/patients/1/appointments')).to route_to(
       controller: "appointments",
      action: "create",
      patient_id: "1"
      )
  end

  it 'routes GET /patients/1/appointments/1/edit to the appointments controller and sets new params' do
    expect(get('/patients/1/appointments/1/edit')).to route_to(
      controller: 'appointments',
      action: 'edit',
      patient_id: '1',
      id: '1'
    )
  end

  it 'routes PATCH /patients/1/appointments/1/update to the appointments controller and sets new params' do
     expect(patch('/patients/1/appointments/1')).to route_to(
      controller: 'appointments',
      action: 'update',
      patient_id: '1',
      id: '1'
    )
  end

   it 'routes DELETE /patients/1/appointments/1 to the patients controller and destroys item' do
    expect(delete('/patients/1/appointments/1')).to route_to(
      controller: 'appointments',
      action: 'destroy',
      patient_id: '1',
      id: '1'
      )
  end

end
