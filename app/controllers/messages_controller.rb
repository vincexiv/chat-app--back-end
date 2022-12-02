class MessagesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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

    def record_not_found(not_found)
        render json: {error: not_found}, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
