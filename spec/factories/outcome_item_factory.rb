FactoryGirl.define do
  sequence(:item_no) { |n| "#{n}" }
  sequence(:description) { |n| "description #{n}" }
  factory :outcome_item do
    item_no
    description
    category 'item_title'
  end
end
