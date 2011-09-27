Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in

	Background:
		Given there are the following users:
			| email	| password |
			| user@ticketee.com | password |

	Scenario: Signing in via confirmation
		And "user@ticketee.com" opens the email with subject "Confirmation instructions"
		And they follow "Confirm my account" in the email
		Then I should see "Your account was successfully confirmed"
		And I should see "Signed in as user@ticketee.com"

	Scenario: Signing in via a form
		And I am on the homepage
		When I follow "Sign In"
		And I fill in "email" with "user@ticketee.com"
		And I fill in "password" with "password"
		And I press "Sign in"
		Then I should see "Signed in successfully."
