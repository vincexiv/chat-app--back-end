class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :username, :bio, :profile_picture
end
