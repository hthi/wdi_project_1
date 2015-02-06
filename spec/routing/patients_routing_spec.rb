require 'rails_helper'

RSpec.describe 'routes for patients' do
  it 'routes GET /patients to the patients controller' do
    expect(get('/patients')).to route_to('patients#index')
  end

  it 'routes GET /patients/new to the patients controller' do
    expect(get('/patients/new')).to route_to('patients#new')
  end
end
