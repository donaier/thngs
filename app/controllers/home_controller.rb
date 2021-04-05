class HomeController < ApplicationController
  def index

  end

  def toggle_help
    current_user.toggle_help
  end
end
