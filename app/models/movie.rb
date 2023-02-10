class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  scope :filter_movie_date, ->(release_date){ where(release_date: release_date)}
  scope :filter_movie, ->(movie_name){ where(name: movie_name)}

  validates :name, presence: true, uniqueness: true
  validates :release_date, :image, presence: true
end
