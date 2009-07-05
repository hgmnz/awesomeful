Given /^a post titled 'Foo' and body 'Lorem Ipsum'$/ do
  Post.create!(:title => 'Foo', :body => 'Lorem Ipsum')
end
