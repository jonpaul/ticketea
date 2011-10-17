module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "create tickets" => "Create tickets"
    }
  end
end
