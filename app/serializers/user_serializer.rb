require 'jsonapi-serializers'

class PostSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :email
  attribute :created_at
  attribute :updated_at
  attribute :auth_token
end