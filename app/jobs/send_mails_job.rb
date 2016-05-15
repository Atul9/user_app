class SendMailsJob < ActiveJob::Base
  queue_as :default

  def perform(email)
		SendNotification.send_mail(email)
  end
end
