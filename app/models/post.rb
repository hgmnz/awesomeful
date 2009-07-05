class Post < ActiveRecord::Base

  default_scope :order => 'created_at desc'
  named_scope :latest, :limit => 1, :order => 'created_at desc'
end
