RSpec.describe CopyrightNoticesHelper do

  before do
    allow(Time).to receive(:now).and_return(Time.new(2014,1,1,0,0))
  end

  context "when the start year is the current year" do
    it "formats it correctly" do
      expect(helper.copyright_notice).to eq "&copy; 2014 Toggle Professional Services LLC"
    end
  end

  context "when the start year is not the current year" do
    it "formats it correctly" do
      expect(helper.copyright_notice(2013)).to eq "&copy; 2013-2014 Toggle Professional Services LLC"
    end
  end

end
