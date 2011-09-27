Given /^there are the following users:$/ do |table|
  table.hashes.each do |attr|
    @user = User.create!(attr)
  end
end
