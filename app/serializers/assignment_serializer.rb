class AssignmentSerializer
  include JSONAPI::Serializer
  attributes :truck_name, :truck_type
  belongs_to :truck
  belongs_to :driver

  attribute :assignment_date do |object|
    object.created_at
  end
end
