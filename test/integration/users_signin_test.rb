require "test_helper"

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "正常にログインできる" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email,
                                  password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select ".alert.alert-success"
  end

  test "パスワードが違う場合はログインできない" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: @user.email,
                                          password: 'wrongpassword' } }
    assert_redirected_to login_path
    follow_redirect!
    assert_select ".alert.alert-danger"
  end
end
