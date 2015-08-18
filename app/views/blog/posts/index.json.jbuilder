json.array!(@blog_posts) do |blog_post|
  json.extract! blog_post, :id, :user_id, :title, :content
  json.url blog_post_url(blog_post, format: :json)
end
