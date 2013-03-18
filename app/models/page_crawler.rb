require 'net/http'

class PageCrawler

  NO_TITLE = 'Title Could Not Be Extracted'

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def best_title
    if content['titles'].any?
      content['titles'].first
    elsif content['header_tags'].any?
      content['header_tags'].first
    else
      NO_TITLE
    end
  end

  def content_type
    content['headers']['content-type']
  end

  def host
    uri.host
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
      end
    rescue NoMethodError
      { 'headers' => get_headers, 'titles' => [ NO_TITLE ] }
    end

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