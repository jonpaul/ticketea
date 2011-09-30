Feature: Deleting Users
  In order to remove users
  As an admin
  I want to click and destroy them

  Background:
    Given there are the following users:
      |email|password|admin|
      |admin@ticketee.com|password|true|
      |user@ticketee.com|password|false|
    And I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Users"

  Scenario: Deleting a user
    And I follow "user@ticketee.com"
    When I follow "Delete User"
    Then I should see "User has been deleted"
    And I should not see "user@ticketee.com"

  Scenario: Cannot delete yourself
    And I follow "admin@ticketee.com"
    When I follow "Delete User"
    Then I should see "You cannot delete yourself!"
    And I should see "admin@ticketee.com"
