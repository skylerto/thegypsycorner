class PagesController < ApplicationController

  # => Homepage
  def home
    @blog_posts = Blog::Post.last(6)
    @users = User.first(6)
  end


end
