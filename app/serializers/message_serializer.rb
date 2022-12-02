class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender, :receiver
end
