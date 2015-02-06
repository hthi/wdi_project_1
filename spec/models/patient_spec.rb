require 'rails_helper'

RSpec.describe Patient do
  describe '.create' do
    it 'creates a new patient' do
      expect(Patient.create()).to be_a Patient
    end
  end
end
