FactoryGirl.define do
  factory :member do
    last_name        { Faker::Name.last_name }
    first_name       { Faker::Name.first_name }
    registered_on    { Faker::Date.backward(15) }
    sequence(:email) { |n| Faker::Internet.safe_email("#{first_name}#{n}") }
    password         { Faker::Internet.password(6, 20) }
    street           { Faker::Address.street_address }
    postal_code      { Faker::Address.postcode }
    city             { Faker::Address.city }
    country          { Member::COUNTRIES.sample }
    website          { [Faker::Internet.url, nil].sample }
    phone_number     { [Faker::PhoneNumber.phone_number, nil].sample }
    mobile_number    { [Faker::PhoneNumber.phone_number, nil].sample }
    after(:create)   { |member| member.permissions.create action: 'manage', controller: 'all' }
  end
end