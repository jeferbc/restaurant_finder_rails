# == Schema Information
#
# Table name: zones
#
#  id         :integer          not null, primary key
#  name       :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Zone < ApplicationRecord
    has_many :locals
    belongs_to :city

    include PgSearch
    pg_search_scope :search_zone, against: [:id]
end
