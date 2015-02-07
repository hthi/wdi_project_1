require 'rails_helper'

RSpec.describe 'routes for patients' do
  it 'routes GET /patients to the patients controller' do
    expect(get('/patients')).to route_to('patients#index')
  end

  it 'routes GET /patients/new to the patients controller' do
    expect(get('/patients/new')).to route_to('patients#new')
  end

  it 'routes POST /patients to the patients controller' do
    expect(post('/patients')).to route_to('patients#create')
  end

  it 'routes GET /patients/1 to the patient controller and sets id' do
    expect(get('/patients/1')).to route_to(
      controller: 'patients',
      action: 'show',
      id: '1'
      )
  end

  it 'routes GET /patients/1/edit to the patients controller and sets new params' do
    expect(get('/patients/1/edit')).to route_to(
      controller: 'patients',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes PATCH /patients/1 to the patients controller and sets new params' do
     expect(patch('/patients/1')).to route_to(
      controller: 'patients',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /patients/1 to the patients controller and sets id' do
    expect(delete('patients/1')).to route_to(
      controller: 'patients',
      action: 'destroy',
      id: '1'
      )
  end
end
