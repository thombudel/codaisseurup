FactoryGirl.define do
  factory :registration do
    user_id nil
    event_id nil
    status "MyString"
    price "9.99"
    guests_count 1
  end
end
