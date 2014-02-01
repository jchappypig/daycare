FactoryGirl.define do
  factory :child do
    first_name 'Huanhuan'
    last_name 'Huang'
    dob 32.years.ago.to_date
  end
end