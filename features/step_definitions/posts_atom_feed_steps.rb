Given /the following posts exist:/ do |posts_table|
  posts_table.hashes.each do |hash|
    Post.create!(:title => hash[:title],
                 :body => hash[:body],
                 :published_at => hash[:published_at])
  end
end

Then /^I should see five entries$/ do 
  response.should have_tag('feed > entry', :count => 5)
end

Then /^I should see a post entry for:$/ do |posts_table|
  posts_table.hashes.each do |hash|
    response.should have_tag('feed > entry') do 
      with_tag 'title', :text => hash[:title]
      with_tag 'content', :text => h(RedCloth.new(hash[:body]).to_html)
    end
  end
end

Then /^I should not see a post entry for:$/ do |posts_table|
  posts_table.hashes.each do |hash|
    response.should_not have_tag('feed > entry') do 
      with_tag 'title', :text => hash[:title]
      with_tag 'content', :text => h(RedCloth.new(hash[:body]).to_html)
    end
  end
end
