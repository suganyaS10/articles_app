require "rails_helper"

RSpec.describe LikesController , :type => :controller do

  describe "POST create" do
    describe 'when the article already had likes row' do
      before do
        @like = Like.create_or_find_by(article_id: 1000)
      end

      context 'when likescontroller#create is called' do
        it 'should increment the likes count' do
          post :create, params: { article_id: 1000 }
          @like.reload
          expect(response.status).to eq(302)
          expect(@like.likes_count).to eq(1)
        end
      end
    end

    describe 'when the article already does not have likes row' do
      context 'when likescontroller#create is called' do
        it 'should increment the likes count' do
          post :create, params: { article_id: 100 }
          @like = Like.find_by(article_id: 100)
          expect(response.status).to eq(302)
          expect(@like.likes_count).to eq(1)
        end
      end
    end
  end
end