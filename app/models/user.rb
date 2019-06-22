class User < ApplicationRecord
  has_many :comics
  has_one :profile

  mount_uploader :cover, UserpicUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
