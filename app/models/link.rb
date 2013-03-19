class Link < ActiveRecord::Base

  has_many :stories, :dependent => :destroy

  scope :unprocessed, where('title IS NULL')

  def self.process
    unprocessed.find_each do |link|
      begin
        page_crawler = PageCrawler.new(link.url)
        link.update_attributes({
          :title => page_crawler.best_title,
          :content_type => page_crawler.content_type,
          :host => page_crawler.host
        })
      rescue
        link.destroy
      end
    end
  end

end
