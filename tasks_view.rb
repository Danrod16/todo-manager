class TasksView
  def display(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "[x]" : "[ ]"
      puts "#{done} #{index + 1} - #{task.description}" # 1 instance of a task
    end
  end


  def ask_user_for_description
    puts "What task?"
    gets.chomp
  end

  def ask_user_for_index
    puts "Which task (index)"
    gets.chomp.to_i
  end
end
