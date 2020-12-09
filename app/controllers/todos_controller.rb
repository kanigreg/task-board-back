class TodosController < ApplicationController
  def create
    todo = Project.find(params[:todo][:project_id]).todos.new(todo_params)
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
