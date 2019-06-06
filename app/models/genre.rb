class Genre < ApplicationRecord
  has_many :comics

  mount_uploader :cover, GenreCoverUploader

  # validates :title, presence: true
end
