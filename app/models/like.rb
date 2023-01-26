class Like < ApplicationRecord
  validates :article_id, presence: true
  # validates :likes_count, numericality: { greater_than_equal: 0 }

  class << self
    def like!(article_id)
      like = create_or_find_by(article_id: article_id)
      like.increment!(:likes_count)
    end

    def unlike!(article_id)
      like = find_by(article_id: article_id)
      like&.decrement!(:likes_count)
    end
  end
end
