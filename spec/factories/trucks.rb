require 'faker'

FactoryBot.define do
  factory :truck do
    name { Faker::Vehicle.make_and_model }
    truck_type { %w[Pickup SUV Semi].sample }
  end
end