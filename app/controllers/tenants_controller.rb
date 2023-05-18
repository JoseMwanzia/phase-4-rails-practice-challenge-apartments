class TenantsController < ApplicationController

    # GET /tenants
    def index 
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    # GET tenants/:id
    def show 
    tenants = Tenant.find(params[:id])
    render json: tenants, status: :ok
    end

    # POST /tenant
    def create
        tenant = Tenant.create!(tenants_params)
        render json: tenant, status: :created
    end

    # UPDATE /tenants/:id
    def update
        tenant = Tenant.find(params[:id])
        tenant.update!(tenants_params)
        render json: tenant
    end
    
    # DELETE /tenants/:id
    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private 
    
    def tenants_params
        params.permit(:name, :age)
    end

end
