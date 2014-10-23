class CustomerInterestAcknowledgementWorker
  include Sidekiq::Worker

  def perform(customer_interest_id)
    customer_interest = CustomerInterest.find_by(id: customer_interest_id)

    return :record_not_found unless customer_interest

    CustomerInterestAcknowledgementMailer.email(customer_interest).deliver
  end

end
