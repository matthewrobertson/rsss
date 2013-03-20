require 'rspec'
require_relative '../../../../lib/scraper/scraper'

describe Scraper::ScrapingStrategyFactory do

  describe '#scraper_for' do

    it 'returns an imagur scraper for imagur.com' do
      result = subject.scraper_for('http://imgur.com/gallery/ONb0b')
      result.should be_a(Scraper::ImagurScraper)
    end

    it 'returns a generic scraper by default' do
      result = subject.scraper_for('http://matthewrobertson.org/blog/2013/02/15/introducing-ress/')
      result.should be_a(Scraper::GenericPageScraper)
    end

  end

end
