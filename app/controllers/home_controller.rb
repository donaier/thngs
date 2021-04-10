class HomeController < ApplicationController
  def home
    @board = current_user.home_board
  end

  def profile
  end

  def toggle_help
    current_user.toggle_help
  end
end
