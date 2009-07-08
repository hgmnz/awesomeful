Given /^there is a post with title "([^\"]*)" and body "([^\"]*)"$/ do |title, body|
  Post.create!(:title => title, :body => body)
end

Given /^there is a post with title "([^\"]*)"$/ do |title|
  Factory(:post, :title => title)
end

