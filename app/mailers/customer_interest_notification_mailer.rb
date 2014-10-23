class CustomerInterestNotificationMailer < ActionMailer::Base

  def email(customer_interest)
    @customer_interest = customer_interest
    mail(to: ENV["NOTIFICATION_EMAIL"], subject: "Customer Interest Notification")
  end

end
