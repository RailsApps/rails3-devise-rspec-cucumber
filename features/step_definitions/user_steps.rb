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

Given /^I fill in the following:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.rows_hash.each do |key, value|
    fill_in(key, :with => value)
  end
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
