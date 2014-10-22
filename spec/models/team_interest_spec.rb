RSpec.describe TeamInterest, :type => :model do
  it { is_expected.to have_attribute :name }
  it { is_expected.to have_attribute :email }
  it { is_expected.to have_attribute :content }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :content }

  it "validates that an email is formatted like an email" do
    subject.email = "not an email"
    subject.valid?
    expect(subject.errors[:email]).to_not be_empty
  end
end
