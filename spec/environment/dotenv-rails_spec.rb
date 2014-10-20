RSpec.describe "dotenv-rails" do
  it "sets the environment variables" do
    expect(ENV["HELLO"]).to eq "WORLD"
  end
end
