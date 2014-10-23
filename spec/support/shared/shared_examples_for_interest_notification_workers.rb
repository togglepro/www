RSpec.shared_examples "interest notification worker" do

  let :element do
    described_class.to_s.gsub(/NotificationWorker/,"").underscore
  end

  context "with an invalid id" do
    it "returns :record_not_found when performed" do
      expect(subject.perform(nil)).to eq :record_not_found
    end
  end

  context "with a valid id" do
    let! :interest do
      FactoryGirl.create(element)
    end
    it "sends the email" do
      expect{subject.perform(interest.id)}.to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end

end
