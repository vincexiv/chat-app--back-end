class MessagesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :authenticate_user, except: [:create, :index, :show, :update, :destroy]
    # I've added :create, :index, :show, :update, and :destroy actions to the list of
    # actions to be ignored during authentication. Idealy, none of the items should be on
    # that list. I chose to do it because the browser was blocking my site from setting
    # cookies in the client due to the cross-site cookie thing that came up because the front
    # end and the backend are deployed on different domains. I found out it was the reason
    # the app was working locally, but when deployed it wasn't working. I couldn't find a way
    # to fix it. That said, you can test the site with full authentication by removing those # in the list and setting the browser to allow cross-site cookies

    def create
        render json: Message.create!(message_params), status: :created
    end

    def index
        render json: Message.all, status: :ok
    end

    def show
        message = Message.find(params[:id])
        render json: message, status: :ok
    end

    def update
        message = Message.find(params[:id])
        message.update!(message_params)
        render json: message, status: :ok
    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        head :no_content
    end

    private
    def message_params
        params.permit(:content, :sender, :receiver)
    end

    def record_not_found
        render json: {error: "Not Authorized"}, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authenticate_user
        User.find(session[:user_id])
    end
end
