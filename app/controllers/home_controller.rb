class HomeController < ApplicationController
  def home
    if params[:board]
      @home_board = Board.find(params[:board])
    else
      @home_board = current_user.home_board
    end
  end

  def profile
  end

  def toggle_help
    current_user.toggle_help
  end
end
