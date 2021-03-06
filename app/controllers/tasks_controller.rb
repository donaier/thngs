class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy, :complete]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if params[:list_name] && !@task.list && List.where(title: params[:list_name]).any?
      @task.update(list_id: List.where(title: params[:list_name]).first.id)
    end
    respond_to do |format|
      if @task.save
        format.js { render :add_task }
      end
    end
  end

  def complete
    if @task.update(completed_from: current_user.id, completed_at: Time.now)
      render :task_completion, task: @task
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:text, :creator, :list_id, :completed_at, :completed_from, :flg_tomorrow, :nbr_prio, :board_id)
    end
end
