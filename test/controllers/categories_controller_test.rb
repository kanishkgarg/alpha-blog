require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.new(name: "sports")
        @category.save
    end
    
   
   test "should get index" do
      get :index
      assert_response :success
   end
   
   test "should get category's new" do
      get :new
      assert_response :success
   end
   
   test "should get categorie's show" do
       get(:show, {'id' => @category.id})
   end
       
end