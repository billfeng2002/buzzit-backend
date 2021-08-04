class Room < ApplicationRecord
    has_many :messages
    has_many :users
    has_many :questions
    validates :room_code, presence: true, uniqueness: true
end
