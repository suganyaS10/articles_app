class LikesController < ApplicationController
  before_action :set_like

  def create
    @like.increment!(:likes_count)
  end  

  private

  def set_like
  	byebug
    @like ||= Like.create_or_find_by(article_id: like_params[:article_id])
  end

  def like_params
  	params.permit(:article_id)
  end
end


	# app/apis/
	# app/controllers/articles_controller.rb
	# app/controllers/likes_controller.rb
	# app/models/article.rb
	# app/models/like.rb
	# app/models/user.rb
	# app/presenters/
	# app/views/articles/
	# db/migrate/
	# tmp/
