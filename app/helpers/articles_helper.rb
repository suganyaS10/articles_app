module ArticlesHelper

  def likes_btn(article)
    likes_count = article.likes_count
    likes_text = case likes_count
    when 0
      'Like'
    when 1 
      "#{likes_count} Like"
    else
      "#{likes_count} Likes"
    end

    button_to likes_text, likes_url(article_id: article.id), method: :post, class: 'btn btn-default btn-sm'
  end
end