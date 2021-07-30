require_relative 'task'
require_relative 'tasks_view'

class TasksController
  def initialize(repository)
    @task_repository = repository
    @view = TasksView.new
  end
  # CRUD (CREATE, READ, UPDATE, DELETE)
  def create
    # 1. ask the user for a description
    user_input = @view.ask_user_for_description
    # 2. create task (instantiate)
    new_task = Task.new(user_input)
    # 3. Send it to the repository -- REPO METHOD
    @task_repository.add(new_task)
  end

  def list
    # reutrn list of all instances in the repo (all) - REPO METHOD
    display_tasks
  end


  def mark_as_done!
    # 1. list the tasks- REPO METHOD
      display_tasks
    # 2. ask the user for index
      task_index = @view.ask_user_for_index
    # 3. Fetch the instance in the repo - REPO METHOD
      task = @task_repository.find(task_index - 1) # instance of task
    # 4. mark as done
      task.mark_as_done
  end

  def destroy
    # 1. list taks- REPO METHOD
    display_tasks
    # 2. ask for an index
    task_index = @view.ask_user_for_index
    # 3. remove the instance from the repo -- REPO METHOD
    @task_repository.remove(task_index - 1)
  end

  private

  def display_tasks
    tasks = @task_repository.all
    @view.display(tasks)
  end
end
