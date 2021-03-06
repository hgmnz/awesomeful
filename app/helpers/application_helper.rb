# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def disqus_comments(url = nil)
    comments = ''
    comments += javascript_tag 'var disqus_developer = 1' if RAILS_ENV == 'development'
    comments += javascript_tag "var disqus_url = #{url}" if url
    comments += content_tag(:div, '', :id => 'disqus_thread')
    comments += javascript_tag '', :src => "http://disqus.com/forums/awesomeful/embed.js"
    comments += content_tag(:noscript, link_to('View the discussion thread', 'http://awesomeful.disqus.com/?url=ref'))
    comments
  end

  def github_badge(user = 'hgimenez')
    badge = ''
    badge += content_tag(:div, '', :id => 'github-badge')
    badge += javascript_tag "var GITHUB_USERNAME='#{user}';"
    badge += javascript_tag '', :src => "http://drnicjavascript.rubyforge.org/github_badge/dist/github-badge-launcher.js"
    badge
  end

  def authenticated_only(&block)
    yield if signed_in?
  end


  def title(page_title)
    content_for(:title) { page_title  + ' | Awesomeful'}
  end
  
end
