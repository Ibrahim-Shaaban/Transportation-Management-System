class TruckSerializer
  include JSONAPI::Serializer
  attributes :name, :truck_type
end
