require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "Homeのnavバーのリンクが正常に動作する" do
    get static_pages_home_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", static_pages_home_path
  end
end
