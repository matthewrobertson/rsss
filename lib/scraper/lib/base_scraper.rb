require 'net/http'

module Scraper
  class BaseScraper

    attr_reader :url

    def initialize(url)
      @url = url
    end

    def host
      uri.host
    end

    protected

      def get_headers
        Net::HTTP.new(host).head(full_path)
      end

      def uri
        URI(url)
      end

      def full_path
        path = uri.path
        path << "?#{uri.query}"    if uri.query
        path << "?#{uri.fragment}" if uri.fragment
        path
      end

  end
end