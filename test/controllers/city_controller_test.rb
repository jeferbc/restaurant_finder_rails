require 'test_helper'

class CityControllerTest < ActionDispatch::IntegrationTest
  test "should get choose_city" do
    get city_choose_city_url
    assert_response :success
  end

end
