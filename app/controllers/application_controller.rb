class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def require_city
        unless request.subdomain != "" && request.subdomain != 'www'
            redirect_to choose_city_path
        end
    end

    def current_city
        City.find_by(name: request.subdomain.humanize)
    end
end
