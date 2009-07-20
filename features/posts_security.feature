Feature: Posts security

  So that posts are protected
  As the site owner
  I want to control who can manage posts

  Scenario: Sign out and try to create a post
    Given I am signed out
    When I go to the new post page
    Then I should see "Sign in"

  Scenario: Sign out and try to publish a post
    Given I sign out
    And there is an unpublished post with title "Foo" and body "this rocks"
    When I go to the homepage
    Then I should not see "Foo"

  Scenario: Sign out and don't see the new post link on the homepage
    Given I am signed out
    When I go to the homepage
    Then I should not see "Admin"
    And I should not see "New Post"

  Scenario: Sign out and don't see the edit post link on the post's page
    Given I am signed out
    And there is a published post with title "Yey"
    When I go to the homepage
    And I follow "Yey"
    Then I should not see "Edit"
    
