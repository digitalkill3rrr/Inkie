class Comic < ApplicationRecord
  mount_uploader :cover, CoverUploader

  validates :genre, :image, presence: true
  # has_one :genre
  # belongs_to :genre
end
