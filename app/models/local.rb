# == Schema Information
#
# Table name: locals
#
#  id            :integer          not null, primary key
#  address       :string
#  phone         :string
#  schedule      :string
#  restaurant_id :integer
#  zone_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Local < ApplicationRecord
  belongs_to :restaurant
  belongs_to :zone
end
