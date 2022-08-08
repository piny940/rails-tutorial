require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Alice", email: "alice@gmail.com", password: "foobar",
      password_confirmation: "foobar")
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

  test "emailは重複してはならない" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "パスワードは空白ではいけない" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "パスワードは6文字以上でないといけない" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
