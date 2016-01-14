class DataMailer < ApplicationMailer
	default from: 'notifications@example.com'
	 
  def data_email
  	@email = Rails.application.secrets.HIDDEN_EMAIL
    mail(to: @email, subject: 'Daily Metal Tracker Data')
  end
end
