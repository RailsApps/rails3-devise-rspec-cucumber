Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    Scenario: I sign in and edit my account
      Given I am a user named "foo" with an email "user@test.com" and password "please"
      When I sign in as "user@test.com/please"
      Then I should be signed in
      When I follow "Edit account"
      And I fill in "Name" with "baz"
      And I fill in "Current password" with "please"
      And I press "Update"
      And I go to the homepage
      Then I should see "User: baz"