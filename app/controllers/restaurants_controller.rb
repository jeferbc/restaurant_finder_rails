class RestaurantsController < ApplicationController
before_action :require_city

    def index
        @zones = current_city.zones.sort { |a,b| a.name.downcase <=> b.name.downcase }
        @locals = Local.joins(:zone, :restaurant).where('zones.city_id = ?', current_city.id)
        @specialties = Specialty.joins(restaurants: [{locals: :zone}]).where("zones.city_id = ?", 1).uniq.sort { |a,b| a.name.downcase <=> b.name.downcase }
        @restaurants = []
        if params[:query].present?
            @restaurants = Restaurant.where("restaurants.name ILIKE ?", "%#{params[:query]}%").joins({locals: :zone}).where("city_id= ?" , current_city).uniq
            @cities = []
        elsif params[:zones].present?
            @restaurants = Restaurant.joins({locals: :zone}).where("city_id= ? and zone_id = ?" , current_city, params[:zones]).uniq
            @cities = []
        elsif params[:specialties].present?
            @restaurants = Restaurant.where('specialty_id = ?', params[:specialties]).joins({locals: :zone}).where("city_id= ?", current_city).uniq
            @cities = []
        end
    end
end
