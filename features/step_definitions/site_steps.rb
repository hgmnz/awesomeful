Given /^I am signed in$/ do
  user = Factory :email_confirmed_user
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{user.email}"}
  And %{I fill in "Password" with "#{user.password}"}
  And %{I press "Sign In"}
end

Given /^I am signed out$/ do
  visit '/session', :delete
end

