class RoomsController < ApplicationController
    def view
        #need the owner name, room code, current question, status, topic, player list
        room=Room.find_by_id(params[:id])        
        render json: room.getRoomInfo
    end

    def create
        room=Room.new(new_room_params)
        if(room.save)
            render json: {room_id: room.id}
        else
            render json: {message: "failed room creation"}
        end
    end

    def update
        room=Room.find_by_id(params[:room_id])
        room.update(current_question_id: params[:current_question_id], topic: params[:topic], status: params[:status])
        render json: {message: "done"}
    end

    def check_exists
        room_code=params[:room_code]
        room=Room.find_by(room_code: room_code)
        if(room)
            render json: {message: "found", room_id: room.id}
        else
            render json: {message: "not found"}
        end
    end

    def new_room_params
        params.permit(:room_code)
    end

end
