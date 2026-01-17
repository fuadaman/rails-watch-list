class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # Validates that the movie/list pair is unique
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
end
