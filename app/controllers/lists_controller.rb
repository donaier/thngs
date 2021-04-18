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
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
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
