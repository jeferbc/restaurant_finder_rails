class RestaurantsController < ApplicationController

    def index
        @cities = City.all
        city = City.find_by(name: request.subdomain.humanize)
        if (request.subdomain != "" && request.subdomain != 'www' && (params[:query].present? || params[:filter].present?))
            if (params[:filter] == "Todos")
                @zones = zone_city.where(city_id: city.id)
            elsif (params[:filter] == "Zona")
                zone_city = Zone.joins(:city)
                @zones = zone_city.search_zone(params[:zones]).where(city_id: city.id)
                @zones_city = Zone.where(city_id: city.id)
            elsif (params[:filter] == "Restaurante")
                local_restaurant = Local.joins(:restaurant)
                @restaurants = local_restaurant.search_restaurant(params[:query])
                @zones = []
            else
                @restaurants = Restaurant.search_restaurant_specialty(params[:query])
                @zones = []
            end
        elsif(request.subdomain != "" && request.subdomain != 'www')
            @zones_city = Zone.where(city_id: city.id)
            @zones = []
            @restaurants = []
            byebug
        else
            @zones = []
            @restaurants = []
            @zones_city = @zones
        end
        # if (request.subdomain != "" && request.subdomain != 'www' && (params[:query].present? || params[:filter].present?))
        #     if (params[:filter] == "Todos")
        #         @zones = Zone.where(city_id: city.id)
        #     elsif (params[:filter] == "Zona")
        #         @zones = Zone.search_zone(params[:query]).where(city_id: city.id)
        #     elsif (params[:filter] == "Restaurante")
        #         @restaurants = Restaurant.search_restaurant_name(params[:query])
        #         @zones = []
        #     else
        #         @restaurants = Restaurant.search_restaurant_specialty(params[:query])
        #         @zones = []
        #     end
        # else
        #     @zones = []
        #     @restaurants = []
        # end
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
