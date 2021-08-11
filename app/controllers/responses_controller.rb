class ResponsesController < ApplicationController
    def create
        @response = Response.new(new_response_params)
        if @response.save
            render json: {message: "response submitted"}
        else
          render json: {message: "response failed to submit"}
        end
    end
    
    def new_response_params
        params.permit(:user_id, :question_id, :option_id)
    end
end
