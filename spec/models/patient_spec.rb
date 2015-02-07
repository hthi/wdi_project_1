require 'rails_helper'

RSpec.describe Patient do
  describe '.create' do
    it 'creates a new patient' do
      expect(Patient.create()).to be_a Patient
    end

    it 'is valid' do
      expect(Patient.create(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')).to be_valid
    end

    it 'is invalid without a name' do
      expect(Patient.create(dob: '1952-02-12', mrn: '523-66-71', email: 'ksmith@gmail.com')).not_to be_valid
    end

    it 'is invalid without a dob' do
      expect(Patient.create(name: 'Kevin Smith', mrn: '523-66-71', email: 'ksmith@gmail.com')).not_to be_valid
    end

    it 'is invalid without a mrn' do
      expect(Patient.create(name: 'Kevin Smith', dob: '1952-02-12', email: 'ksmith@gmail.com')).not_to be_valid
    end

     it 'is invalid without a email' do
      expect(Patient.create(name: 'Kevin Smith', dob: '1952-02-12', mrn: '523-66-71')).not_to be_valid
    end
  end
end


