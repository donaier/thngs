class HomeController < ApplicationController
  def home
    if params[:board]
      @home_board = Board.find(params[:board])
    else
      @home_board = current_user.home_board
    end
  end

  def profile
    @boards = current_user.boards.order(:sort).all
  end

  def toggle_help
    current_user.toggle_help
  end

  def set_tings
    if params[:settings]
      current_user.update(JSON.parse params[:settings])
    end
  end

  def set_home_board
    @board = Board.find(params[:id])

    if @board.owner == current_user.id
      current_user.update(home_board_id: @board.id)
    end
  end

  def set_theme
    if current_user
      current_user.update(theme: params[:theme])
    end
  end
end
