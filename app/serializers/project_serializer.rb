class ProjectSerializer < ApplicationSerializer
  attributes :id, :title

  has_many :todos
end
