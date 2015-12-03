if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else 
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_LReGenvACGWlIy0q7iz2fsug', 
		:secret_key => 'sk_test_KKxqmv2RyrcNvNOmKaWfpT2R',
	}
end 

Stripe.api_key = Rails.configuration.stripe[:secret_key]