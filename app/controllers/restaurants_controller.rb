class RestaurantsController < ApplicationController
before_action :require_city

    def index
        @zones = current_city.zones.sort { |a,b| a.name.downcase <=> b.name.downcase }
        @locals = Local.joins(:zone).joins(:restaurant).where('zones.city_id = ?', current_city.id)
        @specialties = get_specialties(@locals).sort! { |a,b| a.name.downcase <=> b.name.downcase }
        if params[:query].present? && params[:query].length > 0
            @locals = @locals.where('restaurants.name ILIKE ?', "%#{params[:query]}%")
        elsif params[:zones].present? && params[:zones].length > 0
            @locals = @locals.where(zone_id: params[:zones])
        elsif params[:specialties].present? && params[:specialties].length > 0
            @locals = @locals.where('restaurants.specialty_id = ?', params[:specialties])
        end
    end
end
