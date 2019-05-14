require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  test "Home Page in" do
     get pages_home_url
     assert_response :success
  end

  test "Root Page in" do
    get root_url
    assert_response :success
  end
end
