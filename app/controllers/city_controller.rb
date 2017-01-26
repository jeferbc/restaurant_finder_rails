class CityController < ApplicationController
    def choose_city
        @cities = City.all
    end

    def get_city
        id = params[:city_id]
        if id
            redirect_to root_url(subdomain: City.find(id).name)
        else
            flash[:danger] = "An error occured. Please try again"
            redirect_to root_path
        end
    end
end
