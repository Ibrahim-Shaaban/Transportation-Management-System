require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe "create_new_one" do
    let(:name) { "John Doe" }
    let(:email) { "john.doe@example.com" }
    let(:password) { "password" }

    it "creates a new Driver with given name, email, and password" do
      driver = Driver.create_new_one(name, email, password)

      expect(driver.name).to eq(name)
      expect(driver.email).to eq(email.downcase)
      expect(driver.authenticate(password)).to be_present
    end
  end


  describe "handle_login" do
    let(:driver) { create(:driver) }

    context "given valid email and password" do
      it "returns a token and expiration date" do
        result = Driver.handle_login(driver.email, driver.password)
        expect(result[:token]).to be_present
        expect(result[:expires_at]).to be_present
      end
    end

    context "given invalid email" do
      it "raises error" do
        expect {
          Driver.handle_login("invalid_email@example.com", "password")
        }.to raise_error("Invalid credentials")
      end
    end

    context "when given invalid password" do
      it "raises error" do
        expect {
          Driver.handle_login(driver.email, "invalid_password")
        }.to raise_error("Invalid credentials")
      end
    end
  end

  describe '.handle_assignment' do
    let(:driver) { create(:driver) }
    let(:truck) { create(:truck) }
    let(:invalid_truck_id) { 999 }

    context 'when a valid truck id is provided' do
      it 'creates a new assignment' do
        expect {
          Driver.handle_assignment(driver, truck.id)
        }.to change(Assignment, :count).by(1)
      end
    end

    context 'when an invalid truck id is provided' do
      it 'raises an error' do
        expect {
          Driver.handle_assignment(driver, invalid_truck_id)
        }.to raise_error(RuntimeError, 'There is no truck with this id')
      end
    end
  end
end