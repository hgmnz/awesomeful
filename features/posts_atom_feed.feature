Feature: Posts Atom Feed
  So that I can add this site to my feeds reader
  There should be an atom feed with the latest five blog posts

  Scenario: Viewing posts atom feed
    Given the following posts exist:
      | title                 | body                    | published_at  |
      | Purple Haze           | Are in my brain         | 2007-01-01    |
      | Lately things         | Dont seem the same      | 2007-02-02    |
      | Acting funny          | But I dont know why     | 2008-03-23    |
      | Excuse me             | While I kiss the sky    | 2009-01-24    |
      | Purple Haze           | All around              | 2009-02-12    |
      | Don't know            | if Im going up or down  | 2009-04-14    |
      | Am I happy            | or in misery            | 2009-05-23    |
      | Whatever is that girl | put a spell on me       | 2009-06-12    |
    When I go to the posts atom feed
    Then I should see five entries
    And I should see a post entry for:
      | title                 | body                    | published_at  |
      | Whatever is that girl | put a spell on me       | 2009-06-12    |
      | Am I happy            | or in misery            | 2009-05-23    |
      | Don't know            | if Im going up or down  | 2009-04-14    |
      | Purple Haze           | All around              | 2009-02-12    |
      | Excuse me             | While I kiss the sky    | 2009-01-24    |
    And I should not see a post entry for:
      | title                 | body                    | published_at  |
      | Purple Haze           | Are in my brain         | 2007-01-01    |
      | Lately things         | Dont seem the same      | 2007-02-02    |
      | Acting funny          | But I don't know why    | 2008-03-23    |


