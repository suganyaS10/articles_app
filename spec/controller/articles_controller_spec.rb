require "rails_helper"

RSpec.describe ArticlesController , :type => :controller do

  let!(:articles_response) { [ Article.new(title: 'abc', description: 'description', section: 'product',
    status: 'active', created_at: "2020-12-12T10:49:18.000Z", expiry: "2021-04-09T10:49:15.000Z",
    photo_url: "https:\/\/cdn.olioex.com\/uploads\/photo\/file\/00gRGrBRDFYrR2j-9SJVYg\/medium_image.jpg") ]
  }  

  describe "GET index" do
    describe 'Article listing works fine' do 
      before do
        allow(OlioApi::LATEST_CLIENT)
        .to receive(:articles)
        .and_return(articles_response)
      end

      context 'when articles#index is called' do
        it 'should list the articles' do 
          get :index
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'Article API throws exception' do 
      before do
        allow(OlioApi::LATEST_CLIENT)
        .to receive(:articles)
        .and_raise(ApiErrors::FailedResponseError)
      end

      context 'when articles#index is called' do
        it 'exception should be handled and server error page should be rendered' do 
          get :index
          response.should render_template("exception") 
        end
      end
    end
  end
end