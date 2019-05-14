class Genre < ApplicationRecord
  has_many :comics

  # validates :title, presence: true
end
