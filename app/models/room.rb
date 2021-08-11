class Room < ApplicationRecord
    has_many :messages
    has_many :users
    has_many :questions
    validates :room_code, presence: true, uniqueness: true

    def owner
        User.find_by_id(self.owner_id)
    end

    def getRoomInfo
        info={
            owner_name: self.owner.name,
            room_code: self.room_code,
            current_question: Question.find_by_id(self.current_question_id),
            status: self.status,
            topic: self.topic,
            players: self.users, #might change this later
        }

    end
end
