class ApplicationController < ActionController::Base

  protected

  def current_associate
    @current_associate ||= current_user.associate
  end
end
