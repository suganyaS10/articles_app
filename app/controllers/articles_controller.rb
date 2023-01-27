class ArticlesController < ApplicationController

  def index
    # TODO: Optimize to paginate and load in batches using range
    _articles = Article
      .all
    like_counts = find_like_counts(_articles.map(&:id))
    @articles = _articles.map do |_article|
      likes_count = like_counts[_article.id] || 0
      ArticlePresenter.new(_article, likes_count: likes_count)
    end
  rescue ApiErrors::FailedResponseError, ApiErrors::UnknownResponseType
    render "exception"
  end

  private

  def find_like_counts(article_ids)
    return {} unless article_ids.any?
    Like.where(article_id: article_ids)
      .pluck(:article_id, :likes_count)
      .to_h
  end
end
