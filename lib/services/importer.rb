class Importer
  def self.run(songs)
    new(songs).run
  end

  def initialize(videos)
    @cities = extract_cities(videos)
    @artists = extract_artists(videos)
    @songs = extract_songs(videos)
    @videos = extract_videos(videos)
  end

  def run
    ActiveRecord::Base.transaction do
      City.create!(@cities)
      Artist.create!(@artists)
      Song.create!(@songs)
      Video.create!(@videos)
    end
  end

  private

  def extract_cities(videos)
    videos.map do |video|
      video['song'] && video['song']['city']
    end.select do |city|
      city
    end.uniq
  end

  def extract_artists(videos)
    videos.map do |video|
      video['song'] && video['song']['artist']
    end.select do |artist|
      artist
    end.uniq
  end

  def extract_songs(videos)
    videos.map do |video|
      video['song'] && video['song'].slice(*Song.attribute_names)
    end.select do |song|
      song
    end.uniq
  end

  def extract_videos(videos)
    videos.map do |video|
      {
        uid: video['video_uid'],
        song_id: (video['song']['id'] if video['song'])
      }
    end
  end
end
