RSpec.describe TeamInterestNotificationWorker do

  context "with an invalid id" do
    it "returns :record_not_found when performed" do
      expect(subject.perform(nil)).to eq :record_not_found
    end
  end

  context "with a valid id" do
    let! :team_interest do
      FactoryGirl.create(:team_interest)
    end
    it "sends the email" do
      expect{subject.perform(team_interest.id)}.to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end

end
