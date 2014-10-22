FactoryGirl.define do
  factory :team_interest do
    name "John Doe"
    email "johndoe@test.com"
    content "Here is some info about me."
    factory :invalid_team_interest do
      name ""
      email ""
      content ""
    end
  end
end
