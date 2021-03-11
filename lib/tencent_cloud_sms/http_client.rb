require 'net/http'
module TencentCloudSms
  class HttpClient
    class << self
      def get(url, params)
        uri = URI(url)
        uri.query = URI.encode_www_form(params)
        Net::HTTP.get_response(uri)
      end
    end
  end
end
