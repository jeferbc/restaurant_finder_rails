class RestaurantsController < ApplicationController
    def index
        @cities = City.all
        city = City.find_by(name: request.subdomain.humanize)
        if (request.subdomain != "" && request.subdomain != 'www'&& params[:query].present?)
            @zones = Zone.search(params[:query]).where(city_id: city.id)
        else
            @zones = []
        end
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
