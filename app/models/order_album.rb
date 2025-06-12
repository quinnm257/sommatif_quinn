class OrderAlbum < ApplicationRecord
  belongs_to :order
  belongs_to :album_copy
end
