class User < ApplicationRecord
    has_many :lists
    validates :login,
              presence: true,
              uniqueness: true
    validates :password,
              presence: true
end
