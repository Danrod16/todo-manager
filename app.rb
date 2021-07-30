require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'router'

# new_task = Task.new("do the dishes")

task_repository = TaskRepository.new
task_controller = TasksController.new(task_repository)
router = Router.new(task_controller)
router.run
