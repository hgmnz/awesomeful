class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string      :title,     :null => false
      t.text        :body
      t.text        :cached_body_html
      t.timestamp   :published_at, :default => nil
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
