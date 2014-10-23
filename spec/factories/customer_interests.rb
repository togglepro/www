FactoryGirl.define do
  factory :customer_interest do
    name "Jane Doe"
    email "jane@test.com"
    content "I'd like to become a customer."
    factory :invalid_customer_interest do
      name ""
      email ""
      content ""
    end
  end
end
