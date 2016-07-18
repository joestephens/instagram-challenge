FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@email.com"
    end

    password 'password123456'
  end
end
