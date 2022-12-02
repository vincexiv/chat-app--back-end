class Message < ApplicationRecord
    validates :content, presence: true
    validates :sender, presence: true
    validates :receiver, presence: true
end
