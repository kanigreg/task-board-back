class Project < ApplicationRecord
  has_many :todos, class_name: 'Todo', foreign_key: :project_id

  validates :title, presence: true, uniqueness: true
end
