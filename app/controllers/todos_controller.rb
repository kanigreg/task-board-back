class TodosController < ApplicationController
  def create
    project = Project.find_by_id(params[:todo][:project_id])
    unless project
      project = Project.create!({title: params[:project_title]})
    end
    todo = project.todos.new(todo_params)
    todo.save!
    render status: :created, json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_params)
    render json: todo
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :is_completed)
  end
end
