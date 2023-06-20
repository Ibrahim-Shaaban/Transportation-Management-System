class Truck < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :truck_type, presence: true
end
