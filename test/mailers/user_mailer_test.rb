require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token

    mail = UserMailer.account_activation(user)

    assert_equal "アカウント有効化", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.activation_token, mail.body.encoded
    assert_match user.name, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "パスワードをリセット", mail.subject
    # assert_equal ["norepl"], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
