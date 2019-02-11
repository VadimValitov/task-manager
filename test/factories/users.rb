FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    password { "" }
    email { generate :email }
    avatar { "MyString" }
    type { "" }
  end
end
