require 'test_helper'

class LoginPageTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid login" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: {email:" ", password:""} }
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid login" do
    get login_path
    assert_template "sessions/new"
  end
end
