require 'rails_helper'

RSpec.describe Api::V1::TrucksController, type: :controller do
  describe "GET #index" do
    let!(:trucks) { create_list(:truck, 3) }

    it "returns a list of trucks" do
      get :index

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response['data'].size).to eq(3)

      json_response['data'].each_with_index do |truck_data, index|
        expect(truck_data['id']).to eq(trucks[index].id.to_s)
        expect(truck_data['type']).to eq('truck')
        expect(truck_data['attributes']['name']).to eq(trucks[index].name)
        expect(truck_data['attributes']['truck_type']).to eq(trucks[index].truck_type)
      end
    end
  end
end