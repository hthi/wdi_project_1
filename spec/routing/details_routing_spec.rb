require 'rails_helper'

RSpec.describe 'routes for details' do
  it 'routes GET /appointments/1/details/new to the details controller' do
    expect(get('appointments/1/details/new')).to route_to(
    controller: "details",
    action: "new",
    appointment_id: "1"
    )
  end

  it 'routes POST /details to the details controller' do
    expect(post('/appointments/1/details')).to route_to(
      controller: "details",
      action: "create",
      appointment_id: "1"
      )
  end

  it 'routes DELETE /appointments/1/details/1 to the details controller and destroys item' do
    expect(delete('/appointments/1/details/1')).to route_to(
      controller: 'details',
      action: 'destroy',
      appointment_id: '1',
      id: '1'
      )
  end
end
