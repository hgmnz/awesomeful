Given /^there is a published post with title "([^\"]*)" and body "([^\"]*)"$/ do |title, body|
  Post.create!(:title => title, :body => body, :published_at => Time.now)
end

Given /^there is a published post with title "([^\"]*)"$/ do |title|
  Factory(:post, :title => title, :published_at => Time.now)
end

Then /^I should see "([^\"]*)" under Post Drafts$/ do |title|
  response.should have_tag('div', :class => 'post-drafts') do |page|
    page.should contain(title)
  end
end

Given /^there is an unpublished post with title "([^\"]*)" and body "([^\"]*)"$/ do |title, body|
  Post.create!(:title => title, :body => body, :published_at => nil)
end

