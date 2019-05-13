class Comic < ApplicationRecord
  mount_uploader :cover, CoverUploader

  validates :genre, presence: true
  belongs_to :genre
end
