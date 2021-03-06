class User < ActiveRecord::Base
    has_many :articles, dependent: :destroy
    validates :username, presence: true, length: { minimum: 3, maximum: 21 }, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum: 5, maximum: 35 },
                uniqueness: { case_sensitive: false }, 
                format: { with: VALID_EMAIL_REGEX }
                
    has_secure_password
end