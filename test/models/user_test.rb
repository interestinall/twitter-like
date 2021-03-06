require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example Person", email: "ex@bespeil.de", password: "foofoo", password_confirmation: "foofoo")
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

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 51
    assert_not @user.valid?
  end

  test "email should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.-name@example. foo@bar_baz.com foo@bar+baz.com]

      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"

      end
  end


  test "email should not be duplicate" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a min length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?

  end


end

