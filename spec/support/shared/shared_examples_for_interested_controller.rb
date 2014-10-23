RSpec.shared_examples "interested controller" do
  let :prefix do
    described_class.controller_name.classify
  end

  let :notification_worker_class do
    (prefix + "NotificationWorker").constantize
  end

  let :acknowledgement_worker_class do
    (prefix + "AcknowledgementWorker").constantize
  end

  describe "POST #create" do
    before do
      @notification_job_count = notification_worker_class.jobs.count
      @acknowledgement_job_count = acknowledgement_worker_class.jobs.count
      post :create, params
    end

    let :element do
      described_class.controller_name.classify.constantize.model_name.element
    end

    let :params do
      { element => attributes }
    end

    context "with valid data" do
      let :attributes do
        FactoryGirl.attributes_for(element)
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
      it "sets the flash correctly" do
        expect(flash[:notice]).to_not be_nil
      end
      it "creates the customer interest" do
        expect(assigns(:interest)).to be_persisted
      end
      it "queues a job to send a customer interest notification email" do
        expect(notification_worker_class.jobs.count).to eq @notification_job_count + 1
      end
      it "queues a job to send an acknowledgement email" do
        expect(acknowledgement_worker_class.jobs.count).to eq @acknowledgement_job_count + 1
      end
    end
    context "with invalid data" do
      let :attributes do
        FactoryGirl.attributes_for(("invalid_" + element).to_sym)
      end
      it "sets the flash correctly" do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
end
