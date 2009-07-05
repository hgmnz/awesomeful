Feature: Home Page

  So that I can see all the awesome things Harold writes about
  As a site visitor
  I want to see the latest blog posts on the home page

  Scenario: Show latest post
    Given a post titled 'Foo' and body 'Lorem Ipsum'
    When I go to the homepage
    Then I should see "Foo"
    And I should see "Lorem Ipsum"
