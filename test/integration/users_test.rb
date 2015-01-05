require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  test "Anyone can view user information" do
    user = FactoryGirl.create(:user_kazimierz)
    get user_url(user)
    assert_response :success
  end
end
