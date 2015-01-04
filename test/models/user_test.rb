require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid with all attributes" do
    user = User.new
    user = users(:marian)
    assert user.valid?, 'User was not valid'
  end
  test "should respond to results" do
    user = User.new
    assert_respond_to user, :results
  end
  test "should contain results" do
    user = User.new
    assert_equal [results(:marian_1), results(:marian_2)], users(:marian).results
  end

  should validate_presence_of(:name)
  should ensure_length_of(:name).is_at_most(15)
end
