Factory.define :post do |p|
  p.title         'My post'
  p.body          'foo'
  p.published_at  Time.now
end

# clearance factories
Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.email_confirmed { true }
end
# end clearance factories
