namespace :data do

  desc "grab all new links for all twitter users"
  task :twitter => :environment do
    User.find_each { |user| TwitterFeedScraper.new(user).call }
  end

  desc "process all new links filling in content type, title etc"
  task :links => :environment do
    Link.process
  end

  desc "pull down all new twitter links and scrape each one"
  task :fetch => [:twitter, :links]

end