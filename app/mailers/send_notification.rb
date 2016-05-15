class SendNotification < ApplicationMailer
	def send_mail(email)
		mail(to: email, subject: "You have signed up.", body: "Welcome to our website.")
	end
end
