class Post < ActiveRecord::Base


  default_scope :order => 'published_at desc, created_at desc'
  named_scope   :latest,    :limit      => 1, :order => 'published_at desc'
  named_scope   :published, :conditions => 'published_at is not null'
  named_scope   :drafts,    :conditions => 'published_at is null'

  acts_as_taggable_on :post_tags

  has_markup :body, :cache_html => true

  attr_accessible :title, :body, :post_tag_list, :published_at, :published



  # This is a virtual boolean attribute to proxy 
  # the published_at datetime.
  def published=(val)
    if val.to_i == 1 
      if !self.published
        self.published_at = Time.now
      end
    else
      if self.published
        self.published_at = nil
      end
    end
  end

  def published
    !!self.published_at
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def to_s
    title
  end
end
