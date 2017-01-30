module ApplicationHelper
    def get_cities(collection)
        puts collection.inspect
        cities = []
        collection.locals.each do |n|
            cities << n.zone.city.name
        end
        cities
    end
end
