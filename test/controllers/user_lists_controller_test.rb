require 'test_helper'

class UserListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_lists_index_url
    assert_response :success
  end

end
