class Todo < ApplicationRecord
  belongs_to :project, class_name: 'Project'

  validates :text, presence: true
  validates :project, presence: true
end
