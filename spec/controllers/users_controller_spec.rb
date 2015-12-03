require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	before do
		@user = User.create(:email => "ass1@hotmail.de", :password => "12345678", :username => "Fucker")
		@secondUser = User.create(:email => "ass2@hotmail.de", :password => "12345678", :username => "StraffeGiraffe")
		
	end 

	describe "GET#show" do 

		context "User is logged in" do 
			before do
				sign_in @user
			end
			it "loads correct user details" do
				get :show, id: @user.id
				expect(response).to be_success 
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
		end 

		context "User tries to access show page of User1" do
			before do
				sign_in @user
			end
			it "redirects to index" do
				get :show, id: @secondUser.id 
				# expect(response).should_not be_success 
				expect(response).to have_http_status(403)
				expect(responde).to redirect_to(root_path)
			end 

		end

			context "No user is logged in" do 
			it "redirects to login" do
				get :show, id: @user.id
				expect(response).to redirect_to(root_path)
			end 
		end 	



	




	end 



end
