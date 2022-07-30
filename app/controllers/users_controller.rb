class UsersController < ApplicationController 

    def index
        @users = User.all.order(created_at: :asc)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "User was successfully destroyed!"
    end

    private

    def user_params
        params.require(:user).permit(*User::ROLES) 
    end
end

    