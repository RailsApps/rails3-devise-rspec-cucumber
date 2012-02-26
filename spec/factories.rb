FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    confirmed_at Time.now unless Devise::Models::Confirmable.nil?
  end
end