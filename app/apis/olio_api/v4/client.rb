module OlioApi
  module V4
    class Client
      include ApiErrors

      API_ENDPOINT = (
        ENV['OLIO_API_ENDPOINT'] ||
          'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer'
      ).freeze
      API_PATHS = {
        articles: '/test-articles-v4.json'
      }.freeze

      # Improve - Add caching layer to re-fetch only when the 'Etag' differs.
      # If the data can be stale(~15 mins), we can re-fetch in a recurring async worker.
      def articles
        resp = make_request(:get, API_PATHS[:articles])
        map_objects(resp, obj_class: :Article)
      end

      private

      # all the options except 'headers' in `opts` are passed onto HTTP.<meth>
      def make_request(req_method, path, opts = {})
        opts.symbolize_keys!
        req_path = File.join(API_ENDPOINT, path.to_s)
        headers = opts.delete(:headers)

        resp = HTTP.headers(headers)
          .public_send(req_method, req_path, opts)
        handle_response(resp)
      rescue HTTP::Error, FailedResponseError => ex
        handle_http_exception(ex)
      end

      def map_objects(resp, obj_class:)
        wrapper_name = :"#{obj_class}Wrapper"
        raise NotImplemtedError unless OlioApi::V4.const_defined?(wrapper_name)
        wrapper_klass = OlioApi::V4.const_get(wrapper_name)
        Array.wrap(resp).map { |obj_data| wrapper_klass.parse(obj_data) }
      end

      def handle_response(resp)
        return parsed_response(resp) if resp.status.success?
        raise FailedResponseError.new(resp.status.to_s)
      end

      def parsed_response(resp)
        resp_body = resp.body.to_s
        content_type = resp.headers['Content-type']

        case content_type
        when 'application/json'
          Oj.load(resp_body)
        else
          raise UnknownResponseType.new(content_type)
        end
      end

      def handle_http_exception(ex)
        raise ex
      end
    end
  end
end
