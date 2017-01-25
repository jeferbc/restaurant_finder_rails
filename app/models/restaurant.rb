# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  img_url    :string
#  specialty  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
    has_many :zones

    include PgSearch
    pg_search_scope :search_restaurant_name, against: [:name]
    pg_search_scope :search_restaurant_specialty, against: [:specialty]
end
