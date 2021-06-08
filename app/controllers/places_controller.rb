class PlacesController < ApplicationController
    def index
        places = Place.all
        render json: places
    end
    def show
        place = Place.find(params[:id])
        render json: place
    end
    def create
        place = Place.new(
            name:  params[:name],
            address:  params[:address],
        )
        if place.save
            render json: place
        else
            render json: {message: place.errors.full_messages}
        end
    end
    def update
        place = Place.find(params[:id])
        place.name = params[:name] || place.name
        place.address = params[:address] || place.address
        if place.save
            render json: place
        else
            render json: {message: place.errors.full_messages}
        end
        
    end
    def destroy
        place = Place.find(params[:id])
        place.destroy
        render json: {message: "Place deleted"}
    end
end
