class Truck < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :truck_type, presence: true

  has_many :assignments
  has_many :drivers, through: :assignments
end
