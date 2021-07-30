class TaskRepository
  def initialize
    @tasks = []
  end

  # CRUD (Create, Read,Update, Delete)

  def add(task)
    @tasks << task
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def remove(index)
    @tasks.delete_at(index)
  end
end
