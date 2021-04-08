module TasksHelper
  def incomplete(tasks)
    tasks.select{ |t| t.completed? == false }
  end
end
