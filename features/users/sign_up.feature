Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in
      And I am on the home page
      And I go to the sign up page

    Scenario: User signs up with valid data
      Given I am not logged in
      When I sign up with valid user data
      Then I should see a succesfull sign up message
      
    Scenario: User signs up with invalid email
      Given I am not logged in
      When I sign up with an invalid email
      Then I should see an invalid email message

    Scenario: User signs up without password
      Given I am not logged in
      When I sign up without a password
      Then I should see a missing password message

    Scenario: User signs up without password confirmation
      Given I am not logged in
      When I sign up without a confirmed password
      Then I should see a missing password confirmation message

    Scenario: User signs up with mismatched password and confirmation
      Given I am not logged in
      When I sign up with a mismatched password confirmation
      Then I should see a mismatched password message

