class ProjectsController < ApplicationController
  def index
    projects = Project.all
    options = { only: [:id, :title], include: { todos: { only: [:id, :text, :project_id, :is_completed] } } }
    render json: projects.as_json(options)
  end
end
