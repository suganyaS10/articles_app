class LikesController < ApplicationController
  before_action :set_like

  def create
    @like.increment!(:likes_count)
    redirect_to articles_path
  end  

  private

  def set_like
    @like ||= Like.create_or_find_by(article_id: like_params[:article_id])
  end

  def like_params
  	params.permit(:article_id)
  end
end