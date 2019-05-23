require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @chef = Chef.create(name:"kunal",email:"kunal@yopmail.com",
                         password:"password",password_confirmation:"password")
    @recipe = Recipe.create(name:"Lemon Soda",description:"Add Lemon with salh in soda",chef:@chef)
    @recipe2 = @chef.recipes.build(name:"Watermellon",description:"Just Eat")
    @recipe2.save
  end

  test "should get chefs show" do
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
    assert_match @recipe.description, response.body
    assert_match @recipe2.description, response.body
    assert_match @chef.name, response.body
  end
end
