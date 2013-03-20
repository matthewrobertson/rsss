require File.join(File.dirname(__FILE__), 'lib', 'scraping_strategy_factory')
require File.join(File.dirname(__FILE__), 'lib', 'base_scraper')
require File.join(File.dirname(__FILE__), 'lib', 'generic_page_scraper')
require File.join(File.dirname(__FILE__), 'lib', 'imagur_scraper')

module Scraper

  NO_TITLE = 'Title Could Not Be Extracted'

  def self.scrape_page(url)
    ScrapingStrategyFactory.new.scraper_for(url)
  end

end