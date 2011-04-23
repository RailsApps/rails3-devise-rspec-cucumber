Feature: Show Users
  As a visitor to the website
  I want to see registered users listed on the homepage
  so I can know if the site has users

    Scenario: Viewing users
      Given I am a user named "foo" with an email "user@test.com" and password "please"
      When I go to the homepage
      Then I should see "User: foo"
