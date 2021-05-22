class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :destroy]

  def index
    @lists = List.all
    @orphanTasks = Task.orphans.listed
    @orphanLnks = Lnk.orphans
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.js { render :add_list }
      end
    end
  end

  # todo
  def destroy
    @list.tasks.each do |task|
      task.update(list_id: nil, board_id: @list.board_id)
    end
    @list.lnks.each do |lnk|
      lnk.update(list_id: nil, board_id: @list.board_id)
    end
    @list.destroy
    respond_to do |format|
      format.js { render :remove_list }
    end
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title, :owner, :board_id)
    end
end
