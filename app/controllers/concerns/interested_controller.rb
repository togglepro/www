module InterestedController
  extend ActiveSupport::Concern

  def create
    @interest = interest_class.new(interest_params)
    if @interest.save
      notification_worker_class.perform_async(@interest.id)
      acknowledgement_worker_class.perform_async(@interest.id)
      flash[:notice] = create_notice
    else
      flash[:error] = create_error(@interest)
    end
    redirect_to root_path
  end

private

  def create_notice
    "Thanks for your interest. We'll be in touch."
  end

  def create_error(interest)
    error = "There were errors in your form. "
    error << interest.errors.full_messages.collect { |e| e + "." }.join(" ")
  end

  def interest_class
    controller_name.classify.constantize
  end

  def interest_params
    params.require(interest_class.model_name.singular_route_key).permit(:name, :email, :content)
  end

  def interest_prefix
    controller_name.gsub(/_interests/,"").camelize
  end

  def notification_worker_class
    (interest_prefix + "InterestNotificationWorker").constantize
  end

  def acknowledgement_worker_class
    (interest_prefix + "InterestAcknowledgementWorker").constantize
  end

end
