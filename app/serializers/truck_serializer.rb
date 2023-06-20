class TruckSerializer
  include JSONAPI::Serializer
  attributes :name, :truck_type

  has_many :drivers
end
