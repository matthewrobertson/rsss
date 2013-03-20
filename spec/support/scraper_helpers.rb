def scrape_title(url, klass)
  VCR.use_cassette(url) do
    scraper = klass.new(url)
    scraper.best_title
  end
end