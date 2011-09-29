module SeedHelpers
  def create_user!(attributes = {})
    user = Factory(:user, attributes)
    user.confirm!
    user
  end

  RSpec.configure do |c|
    c.include SeedHelpers
  end
end
