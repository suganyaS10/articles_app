class Like < ApplicationRecord
  validates :article_id, presence: true
  # validates :likes_count, numericality: { greater_than_equal: 0 }
end