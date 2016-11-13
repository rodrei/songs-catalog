class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :city
  has_one :video
end
