class LnksController < ApplicationController
  before_action :set_lnk, only: [:show, :edit, :update, :destroy]

  def index
    @lnks = Lnk.all
  end

  def show
  end

  def new
    @lnk = Lnk.new
  end

  def edit
  end

  def create
    @lnk = Lnk.new(lnk_params)

    respond_to do |format|
      if @lnk.save
        format.js { render :add_lnk }
        format.json { render :show, status: :created, location: @lnk }
      else
        format.html { render :new }
        format.json { render json: @lnk.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lnk.update(lnk_params)
        format.html { redirect_to @lnk, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @lnk }
      else
        format.html { render :edit }
        format.json { render json: @lnk.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lnk.destroy
    respond_to do |format|
      format.html { redirect_to lnks_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lnk
      @lnk = Lnk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lnk_params
      params.require(:lnk).permit(:text, :href, :creator, :list_id, :completed_at, :completed_from, :board_id)
    end
end
