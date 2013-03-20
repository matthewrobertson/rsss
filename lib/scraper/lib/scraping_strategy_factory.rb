module Scraper

  class ScrapingStrategyFactory

    def scraper_for(url)
      case host_name(url)
      when 'imgur.com'
        ImagurScraper.new(url)
      else
        GenericPageScraper.new(url)
      end
    end

    private

      def host_name(url)
        URI(url).host
      end

  end

end