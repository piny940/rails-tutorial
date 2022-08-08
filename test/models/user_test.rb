require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Alice", email: "alice@gmail.com")
  end

  test "正常なユーザーを作ることができる" do
    assert @user.valid?
  end

  test "nameはpresentである" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "emailはpresentである" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "emailは長すぎない" do
    @user.email = "a" * 246 + "@gmail.com"
    assert_not @user.valid?
  end
end
