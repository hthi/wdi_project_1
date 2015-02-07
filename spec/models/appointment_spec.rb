require 'rails_helper'

RSpec.describe Appointment do
  describe '.create' do
    it 'creates a new appointment' do
      expect(Appointment.create()).to be_a Appointment
    end
  end
end
