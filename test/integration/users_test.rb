require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  test "Anyone can view user information" do
    user = users(:marian)
    get user_url(user)
    assert_response :success
  end
end
