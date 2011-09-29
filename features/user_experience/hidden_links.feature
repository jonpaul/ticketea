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

  Scenario: New project link is hidden for non-signed in user
    Given I am on the homepage
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for non-signed in user
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for non-users
    Given I am on the homepage
    When I follow "Textmate 2"
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is hidden for regular users
    Given I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "Edit Project" link

  Scenario: Delete project link is hidden for non-users
    Given I am on the homepage
    When I follow "Textmate 2"
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is hidden for regular users
    Given I am signed in as "user@ticketee.com"
    When I follow "Textmate 2"
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "Textmate 2"
    Then I should see the "Delete Project" link
