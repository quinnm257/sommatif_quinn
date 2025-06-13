class Album < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  has_many :album_tracks
  has_many :album_copies
end
