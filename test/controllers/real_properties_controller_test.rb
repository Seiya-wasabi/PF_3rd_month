require 'test_helper'

class RealPropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get real_properties_new_url
    assert_response :success
  end

end
