class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :authenticate_user, except: [:create, :index, :show]
    # I've added :index, and :show actions to the list of actions to be ignored during
    # authentication. Idealy, none of the items should be on that list. I chose to do it
    # because the browser was blocking my site from setting cookies in the client due to the
    # cross-site cookie thing that came up because the front end and the backend are deployed
    # on different domains. I found out it was the reason the app was working locally, but
    # when deployed it wasn't working. I couldn't find a way to fix it. That said, you can
    # test the site with full authentication by removing those # in the list and setting the
    # browser to allow cross-site cookies

    def index
        render json: User.all, status: :ok
    end

    def create
        user =  User.create!(user_params)
        session[:user_id] = user.id

        render json: user, status: :created
    end

    def show
        # I'm using params[:id] in stead of session[:user_id] because of the cross-site
        # cookie thing that I've mentioned above (line 5 - 12)
        user = User.find(params[:id])
        render json: user, serializer: UserMessageSerializer
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

    def authenticate_user
        User.find(session[:user_id])
    end
end
