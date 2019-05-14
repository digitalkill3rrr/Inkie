class Comic < ApplicationRecord
  belongs_to :genre
  belongs_to :user

  mount_uploader :cover, CoverUploader

  validates :user_id, :cover, :title, :genre_id, presence: true
end
