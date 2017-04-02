require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
   
   def setup
      @category = Category.new(name: "sports") 
   end
   
   test "does the category sport exist" do
       assert @category.valid?
   end
   
   test "can the category name be blank?" do
      @category1 = Category.new
      assert_not @category1.valid?
   end
   
   test "can the name be too short?" do
      @category.name = "aa"
      assert_not @category.valid?
   end
   
   test "can the name be too long?" do
      @category.name = "a" * 25
      assert_not @category.valid?
   end
   
   test "can categories have similer name?" do
      @category.save
      @category2 = Category.new(name: "sports")
      assert_not @category2.valid?
   end
end