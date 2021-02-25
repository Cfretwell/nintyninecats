class CatsController < ApplicationController


    def index 
        @cats = Cat.all

        render :index
    end 

    def show 
        @cat = Cat.find_by(id: params[:id])

        if @cat 
            render :show 
        else
            redirect_to cats_url
        end
    end

    def new 
        @cat = Cat.new
        @colors = Cat::COLORS

        render :new 
    end

    def create 
        p cat_params
        @cat = Cat.new(cat_params)
        

        if @cat.save 
            redirect_to @cat  
        else
            p "invaild cat!"
            redirect_to new_cat_url
        end

    end

    def edit 
        @cat = Cat.find_by(id: params[:id])
        @colors = Cat::COLORS
        render :edit 
    end

    def update 
        p cat_params
        @cat = Cat.find_by(id: params[:id])

        if @cat.update (cat_params)
            redirect_to @cat 
        else 
            p "invalid update"
            redirect_to edit_cat_url

        end
    end

    private 

    def cat_params 
        params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
    end

end
