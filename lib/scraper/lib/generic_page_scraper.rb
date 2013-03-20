require 'wombat'

module Scraper

  class GenericPageScraper < BaseScraper

    def best_title
      if content['titles'].any?
        content['titles'].first
      elsif content['header_tags'].any?
        content['header_tags'].first
      elsif content['title_tags']
        content['title_tags'].first
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
          titles "css=article h1, article .title", :list
          header_tags "css=h1", :list
          headers "^[^k]+$", :headers
          title_tags "css=title", :list
        end
      rescue NoMethodError
        { 'headers' => get_headers, 'titles' => [ NO_TITLE ] }
      end

  end
end