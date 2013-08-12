class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_recent_posts

  def load_recent_posts
    @recent = Blog.order('created_at desc').limit(3).all
  end
end
