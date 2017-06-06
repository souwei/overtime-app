FactoryGirl.define do
  sequence :email do | n |
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'sou wei'
    last_name 'wong'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'user'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
