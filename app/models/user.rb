class User < ApplicationRecord
    has_secure_password
    has_many :posts

    validates :password, length: {
        min: 7,
        max: 20,
    }
    validates :email, uniqueness: true
end
