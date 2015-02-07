require 'rails_helper'

RSpec.describe 'routes for appointments' do
  it 'routes GET /patients/1/appoinments to the appointments controller' do
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
end
