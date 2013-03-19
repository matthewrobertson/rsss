class LinksController < ApplicationController

  respond_to :json, :xml, :html

  skip_before_filter :verify_authenticity_token

  before_filter :add_cors_headers
  before_filter :ensure_user


  # GET /links(.:format)
  def index
    TwitterFeedScraper.new(current_user).call
    Link.process
    @stories = current_user.stories.unread.includes(:link)
    respond_with @stories
  end

  # POST /links(.:format)
  def batch
    @stories = current_user.stories
    @stories.update_all(story_params)
    respond_with @stories, :location => links_url
  end

  # GET /links/:id(.:format)
  def show
    @story = current_user.stories.find(params[:id])
    respond_with @story
  end

  # POST /links/:id(.:format)
  def update
    @story = current_user.stories.find(params[:id])
    @story.update_attributes!(story_params)
    respond_with @story, :location => link_url(:id => @story)
  end

  # OPTIONS /links/*
  def options
    headers['Access-Control-Allow-Headers'] = '*, X-Requested-With, X-Prototype-Version, X-CSRF-Token, Content-Type'
    head :ok
  end

  private

    def ensure_user
      head :not_found unless current_user
    end

    def add_cors_headers
      headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def story_params
      params.permit(:is_read)
    end

end