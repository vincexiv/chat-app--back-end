class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :profile_picture
end
