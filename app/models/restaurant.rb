# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string
#  img_url      :string
#  specialty_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Restaurant < ApplicationRecord
    has_many :locals
    belongs_to :specialty

    include PgSearch
    pg_search_scope :search_restaurant, against: [:name]
end
