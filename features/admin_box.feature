Feature: Admin box

  So that I can admin the site
  As the site owner
  I want to see the admin box

  Scenario: Sign in see the admin box on the home page
    Given I am signed in
    When I go to the homepage
    Then I should see "Admin"
