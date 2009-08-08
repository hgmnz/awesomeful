Given /^there is a published post with title "([^\"]*)" and body "([^\"]*)"$/ do |title, body|
  Factory(:post, :title => title, :body => body, :published_at => Time.now)
end

Given /^there is a published post with title "([^\"]*)"$/ do |title|
  Factory(:post, :title => title, :published_at => Time.now)
end

Given /^there is an unpublished post with title "([^\"]*)" and body "([^\"]*)"$/ do |title, body|
  Post.create!(:title => title, :body => body, :published_at => nil)
end

Then /^I should see "([^\"]*)" under the "([^\"]*)" class$/ do |title, html_class|
  response.should have_tag('div', :class => html_class) do |page|
    page.should contain(title)
  end
  # another possibility
  # have_selector("div.#{html_class}", :content => title)
end


