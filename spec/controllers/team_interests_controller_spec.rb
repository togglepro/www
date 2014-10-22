RSpec.describe TeamInterestsController, type: :controller do

  describe "POST #create" do
    before do
      post :create, params
    end
    context "with valid data" do
      let :params do
        { team_interest: FactoryGirl.attributes_for(:team_interest) }
      end
      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
      it "creates the team interest" do
        expect(assigns(:team_interest)).to be_persisted
      end
    end
  end

end
