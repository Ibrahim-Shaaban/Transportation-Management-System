require 'rails_helper'

RSpec.describe TrucksClient do
  describe '#get_all_trucks' do
    let(:subject) { described_class.new }

    it 'returns some truck data' do
      trucks = subject.get_all_trucks
      expect(trucks.length).to be > 0
      expect(trucks.first['id']).to be_present
      expect(trucks.first['name']).to be_present
      expect(trucks.first['truck_type']).to be_present
    end
  end
end