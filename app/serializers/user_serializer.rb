class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :bio, :profile_picture, :messages

  def messages
    Message.where(["sender=? or receiver=?", self.object.id, self.object.id])
  end
end
