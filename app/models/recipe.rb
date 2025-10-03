class Recipe < ApplicationRecord
  validates :name , :ingredients, :instructions, presence: true
  validates :name, uniqueness: true
end