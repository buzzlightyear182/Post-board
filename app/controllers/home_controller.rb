class HomeController < ApplicationController

  before_action :check_logged_in_user

  def welcome
  end

private

  def check_logged_in_user
    if signed_in?
      redirect_to dashboard_path
    end
  end

end
