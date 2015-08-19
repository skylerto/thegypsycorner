class AddPortfolioToArtistsPieces < ActiveRecord::Migration
  def change
    add_reference :artists_pieces, :artists_portfolio, index: true, foreign_key: true
  end
end
