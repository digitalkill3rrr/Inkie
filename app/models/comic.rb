class Comic < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :stories

  mount_uploader :cover, CoverUploader

  validates :user_id, :cover, :title, :genre_id, :description, presence: true
end
