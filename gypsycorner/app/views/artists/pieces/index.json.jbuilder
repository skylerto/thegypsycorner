json.array!(@artists_pieces) do |artists_piece|
  json.extract! artists_piece, :id, :image, :title, :content, :user_id
  json.url artists_piece_url(artists_piece, format: :json)
end
