FactoryBot.define do
  factory :user do
    email { 'naveen123@gmail.com' }
    password { '123456' }
    password_confirmation {'123456'}
  end
end
