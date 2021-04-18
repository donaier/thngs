class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        if current_user.boards.count > 1
          format.js { render :add_board }
        else
          format.html { redirect_to root_path }
        end
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    if @board.lists.empty?
      @board.destroy
      respond_to do |format|
        format.js { render :remove_board, board: @board }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:title, :owner)
    end
end
