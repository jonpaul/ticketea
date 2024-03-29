Feature: Assigning Permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there are the following users:
      |email|password|admin|
      |admin@ticketee.com|password|true|
    And I am signed in as them

    And there are the following users:
      |email|password|
      |user@ticketee.com|password|
    And there is a project called "Textmate 2"

    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "View" for "Textmate 2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@ticketee.com"
    Then I should see "Textmate 2"

  Scenario: Creating tickets for a project
    When I check "View" for "Textmate 2"
    When I check "Create tickets" for "Textmate 2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."
