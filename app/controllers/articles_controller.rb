class ArticlesController < ApplicationController
  def index
    # TODO: Optimize to paginate and load in batches using range
    # Also handle the HTTP exceptions and render a custom view / blank
    _articles = Article.all
    like_counts = find_like_counts(_articles.map(&:id))
    @articles = _articles.map do |_article|
      likes_count = like_counts[_article.id] || 0
      ArticlePresenter.new(_article, likes_count: likes_count)
    end
  end

  private

  def find_like_counts(article_ids)
    return {} unless article_ids.any?
    Like.where(article_id: article_ids)
      .pluck(:article_id, :likes_count)
      .to_h
  end

  # source ~/.rvm/scripts/rvm
end
