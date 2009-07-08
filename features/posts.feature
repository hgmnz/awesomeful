Feature: Posts

  Scenario: Create new blog post
    Given there is a post with title "Bar"
    When I go to the new post page
    And I fill in "title" with "Foo"
    And I fill in "body" with "Lorem Ipsum"
    And I press "Create Post"
    Then I should see "Post created successfully"
    And I should see "Foo"
    And I should see "Lorem Ipsum"
    And I should see "Bar"


  Scenario: View blog post
    Given there is a post with title "Foo" and body "Lorem Ipsum"
    When I go to the homepage
    And I follow "Foo"
    Then I should see "Foo"
    And I should see "Lorem Ipsum"

  Scenario: Edit a blog post
    Given there is a post with title "Awesome!" and body "Zomg this is awesome"
    When I go to the homepage
    And I follow "Awesome!"
    And I follow "Edit"
    And I fill in "Title" with "Not so Awesome"
    And I fill in "Body" with "I changed my mind. Lolz"
    And I press "Save Post"
    Then I should see "Post updated successfully"
    And I should see "Not so Awesome"
    And I should not see "Awesome!"
