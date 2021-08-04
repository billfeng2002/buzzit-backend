class Response < ApplicationRecord
    belongs_to :user
    belongs_to :question
    belongs_to :option
    validates_uniqueness_of :user_id, :scope => [:question_id]
    

    def upsert()
    end
end
