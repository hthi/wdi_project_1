require 'rails_helper'

RSpec.describe 'routes for patients' do
  it 'routes GET /patients to the patients controller' do
    expect(get('/patients')).to route_to('patients#index')
  end
end
