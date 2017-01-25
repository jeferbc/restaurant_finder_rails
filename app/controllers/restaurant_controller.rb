class RestaurantController < ApplicationController
    def index
        @cities = City.all
        city = City.find_by(name: request.subdomain.humanize)
        if (request.subdomain != "" && request.subdomain != 'www' && params[:q].present?)
            @zones = @search.result.where(city_id: city.id)
        else
            @zones = []
        end
    end
end
