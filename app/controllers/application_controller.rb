class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # Everything of Pundit from my pundit learning project 
  # before_action :authorizes

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private
  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action."
    raise if Rails.env.test?
    redirect_to (request.referrer || store_path), notice: "You are not authorized to perform this action."
  end

  protected
    def authorizes
      unless request.format == Mime::HTML
        authenticate_or_request_with_http_basic do |n, p|
          user = User.find_by_name(n)
          if user and user.authenticate(p)
            session[:user_id] = user.id
          end
        end
      else
        return if User.count.zero?

        unless User.find_by_id(session[:user_id])
          redirect_to login_url, notice: "Please log in" 
        end
      end
    end
end
