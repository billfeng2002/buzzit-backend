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
    def optionsDistribution
        allOptions=self.options
        numResponses=self.responses.count
        return allOptions.map{|option|{value: option.value, distribution: option.responses.count.to_s+"/"+numResponses.to_s}}
    end

    def percent_correct
        numResponses=self.responses.count
        numCorrect=self.responses.select{|response| response.option.is_correct}.count
        if(numResponses==0)
            return "N/A"
        end
        return (100*numCorrect.to_f/numResponses).round().to_s+"%"
    end

    def percent_responded
        numResponses=self.responses.count
        numUsers=self.room.users.count-1
        if(numUsers==0)
            return "N/A"
        end
        return (100*numResponses.to_f/numUsers).round().to_s+"%"
    end
end
