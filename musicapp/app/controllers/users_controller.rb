class UsersController < ApplicationController

    before_action :ensure_logged_in

    def show
        # @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login_user!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    # def edit
    #     @user = User.find_by(id: params[:id])
    #     render :edit
    # end

    # def update
    #     @user = User.find_by(id: params[:id])
    #     if @user.update(user_params)
    #         redirect_to user_url(@user)
    #     else
    #         render json: @user.errors.full_messages, status: 422
    #     end
    # end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
