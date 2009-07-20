Feature: View Posts

  So that I can see the awesome posts on this sites
  I should be able to view blog posts

  Scenario: View blog post
    Given there is a published post with title "Foo" and body "Lorem Ipsum"
    When I go to the homepage
    And I follow "Foo"
    Then I should see "Foo"
    And I should see "Lorem Ipsum"
