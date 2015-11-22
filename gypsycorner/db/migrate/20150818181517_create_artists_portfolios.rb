class CreateArtistsPortfolios < ActiveRecord::Migration
  def change
    create_table :artists_portfolios do |t|
      t.attachment :image
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
