# == Schema Information
#
# Table name: locals
#
#  id            :integer          not null, primary key
#  phone         :string
#  schedule      :string
#  restaurant_id :integer
#  zone_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LocalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
