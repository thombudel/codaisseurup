FactoryGirl.define do
  factory :event do
      name            {Faker::Name.name}
      description     {Faker::Lorem.sentence(30)}
      location        {Faker::Address.city}
      price           {Faker::Commerce.price}
      capacity        {Faker::Number.between(0,500)}
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
