class Truck < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :truck_type, presence: true

  has_many :assignments
  has_many :drivers, through: :assignments


  def self.import_from_api
    client = TrucksClient.new
    trucks = client.get_all_trucks
    trucks.each do |truck_data|
      Truck.create(name: truck_data['name'], truck_type: truck_data['truck_type'])
    end
  end
end
