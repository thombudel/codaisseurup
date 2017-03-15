FactoryGirl.define do
  factory :event do
      name            {Faker::Name.sentence(3)}
      description     {Faker::Lorem.sentence(30)}
      location        {Faker::Address.city}
      price           {Faker::Commerce.price}
      capacity        50
      includes_food   true
      includes_drinks false
      starts_at       {Date.today - Faker::Number.number(3).to_i.days}
      ends_at         {Date.today - Faker::Number.number(10).to_i.days}
      user            {build(:user)}

      trait :active do
       active true
     end

     trait :inactive do
       active false
     end
  end
end
