Feature Manage posts

  So that I can share awesome things online
  As the site owner
  I want to be able to manage blog posts

  Scenario: Sign in, create and publish a new blog post
    Given I am signed in
    And there is a published post with title "Bar"
    When I go to the new post page
    And I fill in "title" with "Foo"
    And I fill in "body" with "Lorem Ipsum"
    And I fill in "Tag List" with "Foo, Bar, Baz"
    And I check "Published"
    And I press "Create Post"
    Then I should see "Post created successfully"
    And I should see "Foo"
    And I should see "Lorem Ipsum"
    And I should see "Bar"
    And I should see "Foo" under the "tags" class
    And I should see "Bar" under the "tags" class
    And I should see "Baz" under the "tags" class

  Scenario: Sign in, create a blog post, but don't publish it yet
    Given I am signed in
    And there is a published post with title "Yey"
    When I go to the new post page
    And I fill in "title" with "Foo"
    And I fill in "body" with "Lorem Ipsum"
    And I press "Create Post"
    Then I should see "Post created successfully"
    And I should see "Yey"
    And I should see "Foo" under the "post-drafts" class

  Scenario: Sign in and publish an unpublished posts
    Given I am signed in
    And there is an unpublished post with title "Foo" and body "this rocks"
    When I go to the homepage
    And I follow "Foo"
    And I check "Published"
    And I press "Save Post"
    Then I should see "Post updated successfully"
    And I should see "Foo"
    And I should see "this rocks"

  Scenario: Sign in and edit a blog post
    Given I am signed in
    And there is a published post with title "Awesome!" and body "Zomg this is awesome"
    When I go to the homepage
    And I follow "Awesome!"
    And I follow "Edit"
    And I fill in "Title" with "Not so Awesome"
    And I fill in "Body" with "I changed my mind. Lolz"
    And I press "Save Post"
    Then I should see "Post updated successfully"
    And I should see "Not so Awesome"
    And I should not see "Awesome!"
