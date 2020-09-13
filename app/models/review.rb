class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true, length: { minimum: 40 }
end
