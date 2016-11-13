class CreateBaseModels < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :video_uid
      t.integer :artist_id
      t.integer :city_id
      t.string :title
      t.string :cached_slug
    end

    create_table :artists do |t|
      t.string :title
      t.string :cached_slug
    end

    create_table :cities do |t|
      t.string :title
      t.string :cached_slug
    end

    create_table :videos do |t|
      t.string :uid
      t.integer :song_id
    end

    #add_foreign_key :songs, :artists
    #add_foreign_key :songs, :cities
    #add_foreign_key :videos, :songs
  end
end
