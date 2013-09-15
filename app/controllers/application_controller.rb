class ApplicationController < ActionController::Base
  include BlogsHelper
  protect_from_forgery
  before_filter :load_recent_posts

  def load_recent_posts
    @recent = Blog.order('created_at desc').limit(3).all
  end

  def admin_only!
    unless signed_in? && current_user.admin?
      redirect_to root_path, flash: { error:  "You are not authorized at #{request.fullpath}"}
    end
  end
end
