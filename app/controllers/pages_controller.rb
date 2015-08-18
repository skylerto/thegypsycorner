class PagesController < ApplicationController

  # => Homepage
  def home
    @top_posts = Blog::Post.last(6)
  end


end
