json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :blog_post_id
  json.url tag_url(tag, format: :json)
end
