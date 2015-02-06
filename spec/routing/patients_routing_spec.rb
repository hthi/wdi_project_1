require 'rails_helper'

RSpec.describe 'routes for patients' do
  it 'routes GET /patients to the patients controller' do
    expect(get('/patients')).to route_to('patients#index')
  end

  it 'routes GET /patients/new to the patients controller' do
    expect(get('/patients/new')).to route_to('patients#new')
  end

  it 'routes GET /patients/1 to the patient controller and sets id' do
    expect(get('/patients/1')).to route_to(
      controller: 'patients',
      action: 'show',
      id: '1'
      )
  end
end
