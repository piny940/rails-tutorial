require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @valid_user_params = { name: "Alice", email: "alice@example.com",
                            password: "alice000", password_confirmation: "alice000"}
  end
  
  test "正常にユーザー登録ができる" do
    get new_user_path
    before_count = User.count
    post users_path, params: { user: @valid_user_params }
    assert_equal before_count+1, User.count
  end

  test "ユーザー名は空欄にできない" do
    get new_user_path
    invalid_user_params = @valid_user_params
    invalid_user_params[:name] = ""

    assert_no_difference "User.count" do
      post users_path, params: { user: invalid_user_params }
    end
    assert_template 'users/new'
    assert_select "#error_explanation"
  end
end
