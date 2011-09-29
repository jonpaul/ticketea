Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@ticketee.com" }
  u.password "password"
  u.password_confirmation "password"
end
