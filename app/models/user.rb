class User < ApplicationRecord
    has_many :responses
    belongs_to :room
    has_many :messages
    validates :username, presence: true, uniqueness: true
    
    
end
