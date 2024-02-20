class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new 
    end

    def show
        incoming_id = params[:id]
        @user = User.find_by(id: incoming_id)
        if !@user.nil?
            render :show 
        else
            flash.now[:errors] = 
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

end
