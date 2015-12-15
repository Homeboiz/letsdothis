class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

  	# Create the charge on Stripe's servers - this will charge the user's card
  	begin 
  		charge = Stripe::Charge.create(
  			:amount => @product.price, # amount in cents, again
  			:currency => "usd",
  			
  			:source => token,
  			:description => params[:stripeEmail]
  			)

  		if charge.paid 
  			Order.create(:product_id => @product.id, :total => @product.price, :user_id => @user.id)
  		end 

  	rescue Stripe::CardError => e
  		# The card had been decline
  		body = e.json_body
  		err = body[:error]
  		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

    end
    redirect_to product_path(@product)
  end

end


