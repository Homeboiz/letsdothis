class UserMailer < ApplicationMailer
	default from: "fabianwahlers@hotmail.de"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'fabianwahlers@hotmail.de',
			:subject => "A new contact form message from #{name}")
	end 
end
