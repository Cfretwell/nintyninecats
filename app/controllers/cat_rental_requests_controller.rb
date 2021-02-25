class CatRentalRequestsController < ApplicationController


    def index 
        @cat_rental_requests = CatRentalRequest.all

        render :index
    end 

    # def show 
    #     @cat_rental_request = CatRentalRequest.find_by(id: params[:id])

    #     if @cat_rental_request 
    #         render :show 
    #     else
    #         redirect_to cat_rental_requests_url
    #     end
    # end

    def new 
        @cats = Cat.all
        @cat_rental_request = CatRentalRequest.new

        render :new 

    end

    def create 
        p rental_request_params
        @cat_rental_request = CatRentalRequest.new(rental_request_params)

        if @cat_rental_request.save 
            redirect_to cat_rental_requests_url
        else 
            puts "invalid Rental Request"
            redirect_to new_cat_rental_request_url
        end
    end


    private 

    def rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
    end

end
