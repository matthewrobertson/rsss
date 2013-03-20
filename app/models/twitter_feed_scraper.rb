class TwitterFeedScraper

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    user.recent_tweets.each do |tweet|
      if tweet.attrs[:entities][:urls].length > 0
        process_tweet(tweet)
      end
    end
  end

  def process_tweet(tweet)
    tweet.attrs[:entities][:urls].each do |url|
      link = Link.where(:url => url[:expanded_url]).first_or_create
      user.links << link unless user.stories.where(:link_id => link.id).exists?
    end
  end

end