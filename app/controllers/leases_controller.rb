class LeasesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    # POST /leases
    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    
    # DELETE /leases/:id
    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private 
    
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def render_not_found_response
        render josn: {error: "Lease not found"},status: :not_found
    end
end
