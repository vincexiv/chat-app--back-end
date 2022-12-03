class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender, :receiver, :sender_full_name, :sender_username, :receiver_full_name, :receiver_username

  def sender_full_name
    User.find_by(id: self.object.sender)&.full_name
  end

  def sender_username
    User.find_by(id: self.object.sender)&.username
  end

  def receiver_full_name
    User.find_by(id: self.object.receiver)&.full_name
  end

  def receiver_username
    User.find_by(id: self.object.receiver)&.username
  end
end
