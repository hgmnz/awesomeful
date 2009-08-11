ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.posts_tags '/posts/tags/:tags', :controller => 'posts', :action => 'tags'
  map.resources :users
  #override clearance sign_up
  map.sign_up  'sign_up',
    :controller => 'users',
    :action     => 'new'
  map.root :controller => 'posts'
end
