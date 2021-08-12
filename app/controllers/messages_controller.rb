class MessagesController < ApplicationController
    def get_messages
        roomId=params[:room_id]
        room=Room.find_by_id(roomId)
        messages=room.messages.order(created_at: :asc)
        processedMessages=messages.map{|message| {author: (message.user ? message.user.name : "deleted-user"), value: message.value, id: message.id}}
        lastMsgId=messages.last&.id
        render json: {last_message_id: lastMsgId, messages: processedMessages}
    end

    def create
        message=Message.new(user_id: params[:user_id], value: params[:value], room_id: params[:room_id])
        if(message.save)
            render json: {message: "message sent"}
        else
            render json: {message: "message failed to send"}
        end
    end
end
