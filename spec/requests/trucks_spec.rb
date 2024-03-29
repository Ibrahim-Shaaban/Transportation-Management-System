require 'rails_helper'

RSpec.describe "Trucks", type: :request do
  describe "GET /trucks" do
    let!(:truck) { create(:truck) }

    it "returns a list of trucks" do
      get "/api/v1/trucks"

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')

      json_response = JSON.parse(response.body)
      expect(json_response['data'].size).to eq(1)

      json_response['data'].each_with_index do |truck_data, index|
        expect(truck_data['id']).to eq(trucks[index].id.to_s)
        expect(truck_data['type']).to eq('truck')
        expect(truck_data['attributes']['name']).to eq(trucks[index].name)
        expect(truck_data['attributes']['truck_type']).to eq(trucks[index].truck_type)
      end
    end
  end
end