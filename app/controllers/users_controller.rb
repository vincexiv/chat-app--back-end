class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json: User.all, status: :ok
    end

    def create
        user =  User.create!(user_params)
        session[:user_id] = user.id

        render json: user, status: :created
    end

    def show
        user = User.find(session[:user_id])
        render json: user
    end

    private
    def user_params
        params.permit(:full_name, :email, :username, :password, :password_confirmation, :bio, :profile_picture)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found
        render json: {error: "Not authorized"}, status: :unauthorized
    end
end
