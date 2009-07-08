class Post < ActiveRecord::Base

  default_scope :order => 'created_at desc'
  named_scope :latest, :limit => 1, :order => 'created_at desc'

  has_markup :body, :cache_html => true

  def to_param
    "#{id}-#{title}".gsub(' ','-')
  end
end
