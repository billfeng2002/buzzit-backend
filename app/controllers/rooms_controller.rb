class RoomsController < ApplicationController
    def view
        #need the owner name, room code, current question, status, topic, player list
        room=Room.find_by_id(params[:id])        
        render json: room.getRoomInfo
    end

    def create
        room=Room.new(new_room_params)
        room.status="awaiting"
        room.topic="Welcome to my BuzzIt room!"
        if(room.save)
            render json: {room_id: room.id, message: "room created"}
        else
            render json: {message: "failed room creation"}
        end
    end

    def update
        room=Room.find_by_id(params[:id])
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

    def set_user
        userId=params[:user_id]
        roomId=params[:room_id]
    end

    def user_info
        room=Room.find_by_id(params[:room_id])
        if(!room)
            render json: {status: "closed room"}
            return
        end
        userIds=room.users.map{|user| user.id}
        render json: {room_topic: room.topic, current_question_id: room.current_question_id, room_status: room.status, users: userIds}

    end

    def owner_info
        room=Room.find_by_id(params[:room_id])
        if(!room)
            render json: {status: "closed room"}
            return
        end
        userIds=room.users.map{|user| user.id}
        render json: {room_topic: room.topic, current_question_id: room.current_question_id, room_status: room.status, users: userIds}

    end

    def get_member_info
        room=Room.find_by_id(params[:room_id])
        data=room&.users.select{|user| user.id != room.owner_id}.map{|user| {score: user.score, name: user.name, id: user.id}}
        render json: {count: data&.count, members: data}
    end

    def destroy
        room=Room.find_by_id(params[:id])
        room.users.destroy_all
        room.destroy
        render json: {message: "room deleted"}
    end

    def new_room_params
        params.permit(:room_code)
    end

end
