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

require 'test_helper'

class ZoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
