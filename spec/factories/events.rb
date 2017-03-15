FactoryGirl.define do
  factory :event do
      name            {Faker::Name.sentence(3)}
      description     {Faker::Lorem.sentence(30)}
      location        {Faker::Address.street_name.street_suffix.zip_code.city}
      price           {Faker::Commerce.price}
      capacity        {Faker::Number.between(0-500)}
      includes_food   true
      includes_drinks false
      starts_at       10.days.from_now
      ends_at         15.days.from_now
      user            {build(:user)}

      trait :active do
       active true
     end

     trait :inactive do
       active false
     end
  end
end
