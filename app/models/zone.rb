# == Schema Information
#
# Table name: zones
#
#  id            :integer          not null, primary key
#  phone         :string
#  address       :string
#  schedule      :string
#  city_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Zone < ApplicationRecord
  belongs_to :city
  belongs_to :restaurant

  include PgSearch
  pg_search_scope :search_zone, against: [:restaurant_id, :address]
end
