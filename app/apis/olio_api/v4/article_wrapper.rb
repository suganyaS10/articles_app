module OlioApi
  module V4
    class ArticleWrapper
      class << self
        def parse(data)
          attrs = article_attrs(data)
          Article.new(attrs)
        end

        private

        def article_attrs(data)
          _user_attrs = user_attrs(data)
          user = User.new(_user_attrs)
          photo_url = data['photos']&.first&.dig('files', 'medium')
          image_url = data['images']&.first&.dig('files', 'medium')

          attrs = data.slice(*%w[id title description section status created_at expiry])
          attrs.merge(
            user: user,
            photo_url: photo_url,
            image_url: image_url
          )
        end

        def user_attrs(data)
          user_data = data['user']
          return {} unless user_data.present?

          attrs = user_data.slice(*%w[id first_name])
          attrs.merge(
            avatar_url: user_data.dig('current_avatar', 'small')
          )
        end
      end
    end
  end
end
