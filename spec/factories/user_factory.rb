FactoryGirl.define do
  factory :user do
    email "lol@mail.com"
    password "0123456789"
  end

  factory :admin_user, class: User do
    email User.admin_emails[0]
    password "0123456789"
  end
end
