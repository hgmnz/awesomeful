ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.resources :users
  #override clearance sign_up
  map.sign_up  'sign_up',
    :controller => 'users',
    :action     => 'new'
  map.root :controller => 'posts'
end
