class DriverSerializer
  include JSONAPI::Serializer
  attributes :name, :email
end
