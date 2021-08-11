class QuestionsController < ApplicationController
    def create
        question = Question.new(new_question_params)

        if(question.save)
            #create the options
            options=params[:options]
            options.each{|option|
                Option.create(question_id: question.id, value: option["value"], is_correct: option["is_correct"])
            }

            render json: {message: "succesfully created question and options"}
        else
            render json: {message: "question and option creation failed"}
        end
    end
    
    def new_question_params
        params.permit(:value, :image_url, :question_type, :room_id)
    end
end
