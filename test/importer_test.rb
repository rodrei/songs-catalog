require_relative "test_helper"

describe Importer do
  let(:data) do
    [
      { "video_uid"=>"wWRIyRRyTCI",
        "song" => {
          "id"=>3976, "artist_id"=>2745, "title"=>"Brunch",
          "cached_slug"=>"brunch", "city_id"=>58,
          "artist"=> {"id"=>2745, "title"=>"Xoe Wise", "cached_slug"=>"xoe-wise"},
          "city"=> {"id"=>58, "title"=>"Chicago", "cached_slug"=>"chicago"}
         }
      },
      { "video_uid"=>"ADXyRMsgE8A",
        "song"=> {
          "id"=>3977, "artist_id"=>3194, "title"=>"Found", "cached_slug"=>"found", "city_id"=>58,
          "artist" => {"id"=>3194, "title"=>"Pat McKillen", "cached_slug"=>"pat-mckillen"},
          "city" => {"id"=>58, "title"=>"Chicago", "cached_slug"=>"chicago"}
        }
      },
      { "video_uid"=>"4mUhvAldeiE"}
    ]
  end

  before  do
    Importer.run(data)
  end

  it 'creates cities' do
    assert_equal 1, City.count
    city = City.find(58)

    assert_equal 'Chicago', city.title
    assert_equal 'chicago', city.cached_slug
  end

  it 'creates artists' do
    assert_equal 2, Artist.count
    artist = Artist.find(3194)

    assert_equal 'Pat McKillen', artist.title
    assert_equal 'pat-mckillen', artist.cached_slug
  end

  it 'creates songs' do
    assert_equal 2, Song.count
    song = Song.find(3976)

    assert_equal 2745,     song.artist_id
    assert_equal 58,       song.city_id
    assert_equal "Brunch", song.title
    assert_equal "brunch", song.cached_slug
  end

  describe "Videos creation" do
    it "creates 3 videos" do
      assert_equal 3, Video.count
    end

    it "sets the attributes correctly" do
      video = Video.find_by_uid("ADXyRMsgE8A")
      assert video
      assert_equal 3977, video.song_id
    end
  end
end
