class TodosController < ApplicationController
  attr_reader :serializer_options

  def create
    project = Project.find_or_create_by!(title: params[:project_title])
    todo = project.todos.create!(todo_params)
    render status: :created, json: todo.as_json(only: [:id, :text, :is_completed, :project_id])
  end

  def update
    todo = Todo.update(params[:id], todo_params)
    render json: todo.as_json(only: [:id, :text, :is_completed, :project_id])
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :is_completed)
  end
end
