class Movie < ApplicationRecord
  # Ensure this is the ONLY has_many :bookmarks line
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
