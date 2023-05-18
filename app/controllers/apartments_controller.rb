class ApartmentsController < ApplicationController
    # GET /tenants
    def index 
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    # GET tenants/:id
    def show 
    apartment =Apartmentt.find(params[:id])
    render json: apartment, status: :ok
    end

    # POST /apartment
    def create
        apartment =Apartment.create!(tenants_params)
        render json: apartment, status: :created
    end

    # UPDATE /tenants/:id
    def update
        apartment =Apartmentt.find(params[:id])
        apartment.update!(apartemnt_params)
        render josn: apartment
    end
    
    # DELETE /tenants/:id
    def destroy
        apartment =Apartmentt.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private 
    
    def apartment_params
        params.permit(:number)
    end

    def render_not_found_response
        render josn: {error: "Apartment not found"},status: :not_found
    end
end
