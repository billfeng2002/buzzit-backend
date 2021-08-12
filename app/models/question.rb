class Question < ApplicationRecord
    has_many :options
    has_many :responses
    belongs_to :room
    # validate :has_valid_question_type
    # def has_valid_question_type
    #     accepted_types=["buzzer", "poll", "quiz"]
    #     if(!accepted_types.include?(self.question_type))
    #         errors.add(:question_type, "needs to have valid question type!")
    #     end
    # end
end
