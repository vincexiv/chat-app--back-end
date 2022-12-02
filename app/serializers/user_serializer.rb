class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :bio, :profile_picture
end
