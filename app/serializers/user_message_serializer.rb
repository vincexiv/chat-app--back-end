class UserMessageSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :username, :bio, :profile_picture, :messages

    def messages
      messages = Message.where(["sender=? or receiver=?", self.object.id, self.object.id]).map {|message| message.attributes}

      messages.map do |message|
        new_message = message
        new_message["sender_full_name"] = User.find_by(id: message["sender"])&.full_name
        new_message["sender_username"] = User.find_by(id: message["sender"])&.username
        new_message["receiver_full_name"] = User.find_by(id: message["receiver"])&.full_name
        new_message["receiver_username"] = User.find_by(id: message["receiver"])&.username

        new_message
      end
    end
end
