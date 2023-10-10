require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get page_admin_url
    assert_response :success
  end
end
