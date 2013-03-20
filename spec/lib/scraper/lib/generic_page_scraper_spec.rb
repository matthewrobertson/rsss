require 'spec_helper'

describe Scraper::GenericPageScraper do

  describe '#best_title' do

    it 'it works for Octopress blogs' do
      title = scrape_title 'http://octopress.org/blog/2011/07/23/octopress-20-surfaces/', Scraper::GenericPageScraper
      title.should == 'Octopress 2.0 Surfaces'
    end

    it 'it works for my blog' do
      title = scrape_title 'http://matthewrobertson.org/blog/2013/02/15/introducing-ress/', Scraper::GenericPageScraper
      title.should == 'Introducing RESS'
    end

    it 'it works for smus.com' do
      title = scrape_title 'http://smus.com/really-simple-social-syndication/', Scraper::GenericPageScraper
      title.should == 'Really Simple Social Syndication'
    end

  end

end