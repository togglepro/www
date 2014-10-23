RSpec.describe CopyrightNoticesHelper do

  before do
    allow(Time).to receive(:now).and_return(Time.new(2014,1,1,0,0))
  end

  context "when the start year is the current year" do
    let :correct_format do
      "&copy; 2014 Toggle Professional Services LLC"
    end
    it "formats correctly" do
      expect(helper.copyright_notice).to eq correct_format
    end
  end

  context "when the start year is not the current year" do
    let :correct_format do
      "&copy; 2013 - 2014 Toggle Professional Services LLC"
    end
    it "formats correctly" do
      expect(helper.copyright_notice(2013)).to eq correct_format
    end
  end

end
