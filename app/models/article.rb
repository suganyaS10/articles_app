class Article
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :big_integer
  attribute :title, :string
  attribute :description, :string
  attribute :section, :string
  attribute :status, :string
  attribute :expiry, :datetime
  attribute :created_at, :datetime
  attribute :photo_url, :string
  attribute :image_url, :string
  attribute :likes, :integer

  # acts like association
  attr_accessor :user

  class << self
    def all
      OlioApi::LATEST_CLIENT.articles
    end
  end
end
