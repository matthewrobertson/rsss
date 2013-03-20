class HomeController < ApplicationController
  def index
    if current_user
      redirect_to links_url
    end
  end
end
