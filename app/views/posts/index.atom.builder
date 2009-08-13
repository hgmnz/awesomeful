atom_feed :schema_date => 2009 do |feed|
  feed.title("Awesomeful.net")
  feed.subtitle("Full of awesomeness")
  feed.updated(@posts.first.published_at)

  @posts.each do |post|
    feed.entry(post, :published => post.published_at) do |entry|
      entry.title(post.title)
      entry.content(post.cached_body_html, :type => 'html')
      entry.author do |author|
        author.name("Awesomeful.net")
      end
    end
  end
end

