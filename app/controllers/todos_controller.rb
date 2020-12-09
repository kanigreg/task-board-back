class TodosController < ApplicationController
  def create
    project = Project.find(params[:todo][:project_id])

    render status: :bad_request if project.nil?

    todo = project.todos.new(todo_params)
    todo.save

    render status: :created, json: todo
  end

  def update
    todo = Todo.find(params[:id])

    render status: :bad_request if todo.nil?

    todo.update(todo_params)
    render json: todo
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :is_completed)
  end
end
