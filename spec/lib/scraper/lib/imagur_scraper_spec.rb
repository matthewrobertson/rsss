require 'spec_helper'

describe Scraper::ImagurScraper do

  describe '#best_title' do

    it 'pulls the title from gallery images' do
      title = scrape_title 'http://imgur.com/gallery/ONb0b', Scraper::ImagurScraper
      title.should == 'Guns in movies scenes replaced with a thumbs-up'
    end

    it 'pulls the title from regular images' do
      title = scrape_title 'http://imgur.com/r/atheism/MOhVckp', Scraper::ImagurScraper
      title.should == 'I see what you did there, Facebook God'
    end

  end

end