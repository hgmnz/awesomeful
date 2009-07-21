Feature: Sign up
  In order to protect the site from any user
  As a site owner
  Nobody should be allowed to sign up

  Scenario: User tries to sign up
    When I go to the sign up page
    Then I should see "What? Why do you try to sign up?"

