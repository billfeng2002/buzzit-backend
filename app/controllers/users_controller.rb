class UsersController < ApplicationController
    def create
        user = User.new(new_user_params)
        
        if user.save
          if(params[:owner])
            Room.setRoomOwner(params[:room_id], user.id)
          end
          render json: {user_id: user.id, message: "user created"}
        else
          render json: {message: "Error creating user. Try a different name."}
        end
    end
    def update
        user = User.find_by_username(params[:username])
        user.name=params[:name]
        if user.save
            render json: {message: "successfully changed name"}
        else
            render json: {message: "failed to change name"}
        end

    end

    def destroy
        User.destroy(params[:id])
        render json: {message: "user deleted"}
    end

    def new_user_params
        params.permit(:name, :room_id)
    end

end
