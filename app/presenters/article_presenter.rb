class ArticlePresenter < BasePresenter
  def likes_count
    options[:likes_count] || 0
  end
end
