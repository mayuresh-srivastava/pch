factory :user do
  email { Faker::Internet.email } # {FactoryGirl.generate(:email)}
  login { Faker::Name.first_name }
  password 'jumpup'
  password_confirmation 'jumpup'
end
