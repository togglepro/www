RSpec.describe TeamInterestsController, type: :controller do

  describe "POST #create" do
    before do
      @team_interest_notification_job_count = TeamInterestNotificationWorker.jobs.count
      @team_interest_acknowledgement_job_count = TeamInterestAcknowledgementWorker.jobs.count
      post :create, params
    end
    let :params do
      { team_interest: attributes }
    end
    context "with valid data" do
      let :attributes do
        FactoryGirl.attributes_for(:team_interest)
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
      it "sets the flash correctly" do
        expect(flash[:notice]).to eq TeamInterestsController::CREATE_NOTICE
      end
      it "creates the team interest" do
        expect(assigns(:team_interest)).to be_persisted
      end
      it "queues a job to send a team interest notification email" do
        expect(TeamInterestNotificationWorker.jobs.count).to eq @team_interest_notification_job_count + 1
      end
      it "queues a job to send an acknowledgement email" do
        expect(TeamInterestAcknowledgementWorker.jobs.count).to eq @team_interest_acknowledgement_job_count + 1
      end
    end
    context "with invalid data" do
      let :attributes do
        FactoryGirl.attributes_for(:invalid_team_interest)
      end
      it "sets the flash correctly" do
        expect(flash[:error]).to include TeamInterestsController::CREATE_ERROR
      end
    end
  end

end
