require 'test_helper'

class ChefEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @chef = Chef.create(name:"kunal",email:"kunal@yopmail.com",
                         password:"password",password_confirmation:"password")
  end

  test "Invalid Edit" do
    get edit_chef_path(@chef)
    assert_template "chefs/edit"
    patch chefs_path(@chef), params: {chef: { name:" ",email:"kunal@yopmail.com"} }
    assert_template "chefs/edit"
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
  end

  test "Valid Edit" do
    get edit_chef_path(@chef)
    assert_template "chefs/edit"
    patch chefs_path(@chef), params: {chef: { name:"kunal1",email:"kunal1@yopmail.com"} }
    assert_redirect_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "kunal1", @chef.name
    assert_match "kunal1@yopmail.com", @chef.email
  end

end
