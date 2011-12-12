Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
end

Then /^I should be already signed in$/ do
  page.should have_content "Logout"
end

Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  visit '/users/sign_out'
  visit '/users/sign_in'
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
end

Then /^I should be signed in$/ do
  page.should have_content "Signed in successfully."
end

When /^I return next time$/ do
  visit '/'
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I go to the sign in page$/ do
  visit '/users/sign_in'
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I go to the home page$/ do
  visit '/'
end

Given /^I am on the home page$/ do
  visit '/'
end

Given /^I go to the sign up page$/ do
  visit '/users/sign_up'
end

When /^I press "([^"]*)"$/ do |label|
  click_button label
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I go to the homepage$/ do
  visit '/'
end

When /^I follow "([^"]*)"$/ do |text|
  click_link text
end

def sign_up user
  visit '/users/sign_up'
  fill_in "Name", :with => user[:name]
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  fill_in "Password confirmation", :with => user[:password_confirmation]
  click_button "Sign up"
end

When /^I sign up with valid user data$/ do
  user = { :name => "Testy McUserton", :email => "testy@userton.com",
    :password => "please", :password_confirmation => "please"}
  sign_up user
end

Then /^I should see a succesfull sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

When /^I sign up with an invalid email$/ do
  user = { :name => "Testy McUserton", :email => "notanemail",
    :password => "please", :password_confirmation => "please"}
  sign_up user
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

When /^I sign up without a password$/ do
  user = { :name => "Testy McUserton", :email => "notanemail",
    :password => "", :password_confirmation => "please" }
  sign_up user
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

When /^I sign up without a confirmed password$/ do
  user = { :name => "Testy McUserton", :email => "notanemail",
    :password => "please", :password_confirmation => "" }
  sign_up user
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

When /^I sign up with a mismatched password confirmation$/ do
  user = { :name => "Testy McUserton", :email => "notanemail",
    :password => "please", :password_confirmation => "please123" }
  sign_up user
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Given /^I am logged in$/ do
  user = { :name => "Testy McUserton", :email => "testy@userton.com",
    :password => "please", :password_confirmation => "please"}
  sign_up user
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out"
end

When /^I return to the site$/ do
  visit '/'
end
