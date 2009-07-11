Feature: Posts

  Scenario: Create and publish a new blog post
    Given there is a published post with title "Bar"
    When I go to the new post page
    And I fill in "title" with "Foo"
    And I fill in "body" with "Lorem Ipsum"
    And I check "Published"
    And I press "Create Post"
    Then I should see "Post created successfully"
    And I should see "Foo"
    And I should see "Lorem Ipsum"
    And I should see "Bar"

  Scenario: Create a blog post, but don't publish it yet
    Given there is a published post with title "Yey"
    When I go to the new post page
    And I fill in "title" with "Foo"
    And I fill in "body" with "Lorem Ipsum"
    And I press "Create Post"
    Then I should see "Post created successfully"
    And I should see "Yey"
    And I should see "Foo" under Post Drafts


  Scenario: View blog post
    Given there is a published post with title "Foo" and body "Lorem Ipsum"
    When I go to the homepage
    And I follow "Foo"
    Then I should see "Foo"
    And I should see "Lorem Ipsum"

  Scenario: Edit a blog post
    Given there is a published post with title "Awesome!" and body "Zomg this is awesome"
    When I go to the homepage
    And I follow "Awesome!"
    And I follow "Edit"
    And I fill in "Title" with "Not so Awesome"
    And I fill in "Body" with "I changed my mind. Lolz"
    And I press "Save Post"
    Then I should see "Post updated successfully"
    And I should see "Not so Awesome"
    And I should not see "Awesome!"

  Scenario: Publish an unpublished posts
    Given there is an unpublished post with title "Foo" and body "this rocks"
    When I go to the homepage
    And I follow "Foo"
    And I check "Published"
    And I press "Save Post"
    Then I should see "Post updated successfully"
    And I should see "Foo"
    And I should see "this rocks"

