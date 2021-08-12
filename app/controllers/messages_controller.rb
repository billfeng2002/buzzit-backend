class MessagesController < ApplicationController
    def get_messages
        roomId=params[:room_id]
        room=Room.find_by_id(roomId)
        messages=room.messages.order(created_at: :asc)
        processedMessages=messages.map{|message| {author: message.user.name, value: message.value}}
        lastMsgId=messages.last&.id
        render json: {last_message_id: lastMsgId, messages: processedMessages}
    end
end
