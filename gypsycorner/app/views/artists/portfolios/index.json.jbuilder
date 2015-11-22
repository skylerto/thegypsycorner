json.array!(@artists_portfolios) do |artists_portfolio|
  json.extract! artists_portfolio, :id, :image, :title, :content, :user_id
  json.url artists_portfolio_url(artists_portfolio, format: :json)
end
