class User < ApplicationRecord
    has_secure_password

    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
