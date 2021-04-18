class LnksController < ApplicationController
  # before_action :set_lnk, only: [:show]

  def index
    @lnks = Lnk.all
  end

  def show
  end

  def new
    @lnk = Lnk.new
  end

  def create
    @lnk = Lnk.new(lnk_params)

    respond_to do |format|
      if @lnk.save
        format.js { render :add_lnk }
      end
    end
  end

  # todo
  def destroy
    @lnk.destroy
    respond_to do |format|
      format.html { redirect_to lnks_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # def set_lnk
    #   @lnk = Lnk.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def lnk_params
      params.require(:lnk).permit(:text, :href, :creator, :list_id, :completed_at, :completed_from, :board_id)
    end
end
