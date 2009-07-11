class Post < ActiveRecord::Base

  default_scope :order => 'published_at desc, created_at desc'
  named_scope :latest,    :limit => 1, :order => 'published_at desc'
  named_scope :published, :conditions => 'published_at is not null'
  named_scope :drafts,    :conditions => 'published_at is null'

  has_markup :body, :cache_html => true

  # This is a virtual boolean attribute to proxy 
  # the published_at datetime.
  def published=(val)
    if val.to_i == 1
      self.published_at = Time.now
    else
      self.published_at = nil
    end
  end

  def published
    !!published_at
  end

  def to_param
    "#{id}-#{title}".gsub(' ','-')
  end
end
