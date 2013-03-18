class User < ActiveRecord::Base

  has_many :stories
  has_many :links, :through => :stories

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def recent_tweets
    has_twitter? ? twitter_client.home_timeline(:count => 200) : []
  end

  private

    def has_twitter?
      provider == "twitter"
    end

    def twitter_client
      if has_twitter?
        Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
      end
    end

    def timeline_urls
      urls = []
      twitter.home_timeline.each do |tweet|
        if tweet.attrs[:entities][:urls]
          tweet.attrs[:entities][:urls].each do |url|
            urls << url[:expanded_url]
          end
        end
      end
      urls
    end

    def url_tweets
      twitter.home_timeline.select { |tweet| tweet.attrs[:entities][:urls].length > 0 }
    end

end
