require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.new(name: "sports")
        @category.save
        @user = User.create(username:"kanishk", email:"kanishk.123@gmail.com", password: "password", admin: true)
    end
    
   
   test "should get index" do
      get :index
      assert_response :success
   end
   
   test "should get category's new" do
       session[:user_id] = @user.id
       get :new
       assert_response :success
   end
   
   test "should get categorie's show" do
       get(:show, {'id' => @category.id})
   end
   
   test "should redirect create when not logged in" do
       assert_no_difference 'Category.count' do
           post:create, category:{name: "sports"}
       end
       assert_redirected_to categories_path
   end
end