class CustomerInterestAcknowledgementMailer < ActionMailer::Base

  def email(customer_interest)
    @customer_interest = customer_interest
    mail(to: customer_interest.email, subject: "Thanks for Your Interest")
  end

end
