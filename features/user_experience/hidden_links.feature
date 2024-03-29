Feature: Hidden Links
  In order to clean up the user experience
  As the system
  I want to hide links from users who can't act on them

  Background:
    Given there are the following users:
      |email|password|admin|
      |admin@ticketee.com|password|true|
      |user@ticketee.com|password|false|
    And there is a project called "Textmate 2"
    And "user@ticketee.com" has created a ticket for this project:
      |title|description|
      |Shiny!|My eyes! My eyes!|

  Scenario: New project link is hidden for non-signed in user
    Given I am on the homepage
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for non-signed in user
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "Edit Project" link

  Scenario: Delete project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "Delete Project" link

  Scenario: New ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And "user@ticketee.com" can create tickets on the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "New Ticket" link

  Scenario: New ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    Then I should not see the "New Ticket" link

  Scenario: New ticket link is visable for admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "New Ticket" link

  Scenario: Edit ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And "user@ticketee.com" can edit tickets on the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should see the "Edit Ticket" link

  Scenario: Edit ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should not see the "Edit Ticket" link

  Scenario: Edit ticket link is visable for admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should see the "Edit Ticket" link

  Scenario: Delete ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And "user@ticketee.com" can delete tickets on the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should see the "Delete Ticket" link

  Scenario: Delete ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "Textmate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should not see the "Delete Ticket" link

  Scenario: Delete ticket link is visable for admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    And I follow "Shiny!"
    Then I should see the "Delete Ticket" link
