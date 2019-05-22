require 'test_helper'

class ChefsSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "should get signup path" do
      get signup_path
      assert_response :success
  end

  test "Invalid Submission" do
      get signup_path
      assert_no_difference "Chef.count" do
        post chefs_path, params: {chef: { name:" ",email:" ",password:'password',
                                          password_confirmation:" " } }
      end
      assert_template "chefs/new"
      assert_select "h2.panel-title"
      assert_select "div.panel-body"
  end

  test "Valid Submission" do
      get signup_path
      #assert_no_difference "Chef.count" do
        post chefs_path, params: {chef: { name:"kunal1",email:"kunal.vashist1@ordwaylabs.com",password:'password',
                                          password_confirmation:"password" } }
      #end
      follow_redirect!
      assert_template "chefs/show"
      assert_not flash.empty?
  end
end

