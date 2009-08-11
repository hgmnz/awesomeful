module PostsHelper

  def tag_links(tag_counts)
    returning String.new do |s|
      tag_counts.each do |tag|
        s << ' ' + content_tag(:span, link_to(tag.name, posts_tags_path(:tags => tag.name)) , :class => 'tag', :id => "#{tag.name.parameterize}-tag")
      end
    end
  end

end
