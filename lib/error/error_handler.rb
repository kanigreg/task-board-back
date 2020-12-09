module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError do
          respond(:internal_server_error, 'Oops, something is wrong')
        end
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:not_found, e.to_s)
        end
        rescue_from ActiveRecord::RecordInvalid do |e|
          respond(:bad_request, e.to_s)
        end
      end
    end

    private

    def respond(status, message)
      render json: { errors: [message] }, status: status
    end
  end
end
