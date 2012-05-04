FactoryGirl.define do
  factory :user do
    name     "David Karapetyan"
    email    "david.karapetyan@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
