class ApartmentsController < ApplicationController

    # GET /apartments
    def index 
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    # GET apartments/:id
    def show 
    apartment =Apartment.find(params[:id])
    render json: apartment, status: :ok
    end

    # POST /apartment
    def create
        apartment =Apartment.create!(apartments_params)
        render json: apartment, status: :created
    end

    # UPDATE /apartments/:id
    def update
        apartment =Apartment.find(params[:id])
        apartment.update!(apartments_params)
        render json: apartment, status: :created
    end
    
    # DELETE /apartments/:id
    def destroy
        apartment =Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private 
    
    def apartments_params
        params.permit(:number)
    end

end
