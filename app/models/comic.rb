class Comic < ApplicationRecord
  mount_uploader :cover, CoverUploader

  validates :genre, presence: true
  # has_one :genre
end
