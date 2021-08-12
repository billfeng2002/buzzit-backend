class QuestionsController < ApplicationController
    def create
        question = Question.new(self.new_question_params)
        if(question.save)
            #create the options
            options=params[:options]
            options.each{|option|
                Option.create(question_id: question.id, value: option["value"], is_correct: option["is_correct"])
            }

            render json: {message: "success", question_id: question.id}
        else
            render json: {message: "question and option creation failed"}
        end
    end
    
    def show
        question=Question.find_by_id(params[:id]) #option needs id and value
        options=question.options.map{|option| {"id": option.id, "value": option.value}}
        render json: {"img": question.image_url, "value": question.value,"options": options}
    end

    def stats
        room=Room.find_by_id(params[:room_id])
        currentQuestionId=room.current_question_id
        if(!currentQuestionId)
            render json: {"error": "no question set"}
            return
        else
            currentQuestion=Question.find_by_id(currentQuestionId)

            render json: {value: currentQuestion.value, 
                options: currentQuestion.optionsDistribution, num_responded: currentQuestion.responses.count,
                percent_correct: currentQuestion.percent_correct,
                percent_responded: currentQuestion.percent_responded}
        end
    end
    
    def new_question_params
        params.permit(:value, :image_url, :room_id)
    end
end
