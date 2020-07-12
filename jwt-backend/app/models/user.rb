class User < ApplicationRecord
    has_secure_password
    has_many :tasks

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum:8, maximum:200}
end
