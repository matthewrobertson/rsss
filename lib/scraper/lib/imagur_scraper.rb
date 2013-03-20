module Scraper
  class ImagurScraper < BaseScraper

    def best_title
      if content['titles'].any?
        content['titles'].first
      else
        NO_TITLE
      end
    end

    def content_type
      content['headers']['content-type']
    end

    private

      def content
        @content ||= parse_content
      end

      def parse_content
        _url = url

        Wombat.crawl do
          base_url _url
          titles "css=#image-title", :list
          headers "^[^k]+$", :headers
        end
      rescue NoMethodError
        { 'headers' => get_headers, 'titles' => [ NO_TITLE ] }
      end

  end
end