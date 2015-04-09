require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example Person", email: "ex@bespeil.de")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be there" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email should be there" do
    @user.email = "   "
    assert_not @user.valid?
  end

end
