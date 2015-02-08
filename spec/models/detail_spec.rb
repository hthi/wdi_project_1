require 'rails_helper'

RSpec.describe Detail do
  describe '.create' do
    it 'creates a new detail' do
      expect(Detail.create()).to be_a Detail
    end
  end
end
