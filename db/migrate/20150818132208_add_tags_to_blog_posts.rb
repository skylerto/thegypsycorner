class AddTagsToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :tag, :string
  end
end
