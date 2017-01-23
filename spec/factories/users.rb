FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'password' }

    after(:build) do |user|
      user.password_confirmation = user.password
    end
  end
end
