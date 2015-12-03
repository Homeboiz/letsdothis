require 'rails_helper'

RSpec.describe Product, type: :model do
  
  context "When the product has comments" do
  	before do 
  		@product = Product.create(:name => "race bike")
  		@user = User.create(:email => "test@test.de", :username => "Test", :password => "TestTest")
		@product.comments.create(:rating => 1, :user => @user, :body => "Shit bike!") 
		@product.comments.create(:rating => 3, :user => @user, :body => "Medium bike!")  		
		@product.comments.create(:rating => 5, :user => @user, :body => "Super bike!")  		
		end 

	it "returns the average rating of all comments" do
	end 




  	

  end 


  context "When the product has a description without a name" do
	  before do 
	  	@product = Product.create(:description => "sexy bike")
	  end 
	  it "should return invalid" do 
	  	expect(@product).not_to be_valid
	  end 
   end 


end
