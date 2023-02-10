class Rating < ApplicationRecord
  after_save :update_average
  belongs_to :movie

  def update_average
    self.movie.update(rating_average: self.movie.ratings.average(:star))
  end
end
