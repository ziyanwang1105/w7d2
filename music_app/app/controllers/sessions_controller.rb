class SessionsController < ApplicationController

    def create
        incoming_email= params[:user][:email]
        incoming_password= params[:user][:password]
        @user = User.find_by_credentials(incoming_email, incoming_password)
        if @user
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors]= ["Incorrect email and/or password"]
            render :new
        end

    end

    def destroy
        log_out
        redirect_to new_session_url

    end

    def new
        @user = User.new
        render :new
    end
end
