class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    private 

    def render_invalid_response(invalid)
        render josn: {
            errors: invalid.record.errors.full_messages
            },
             status: :unprocessable_entity
    end

    # def render_not_found_response(e)
    #     render josn: {
    #         error: e.to_s
    #         },
    #          status: :not_found
    # end

end
