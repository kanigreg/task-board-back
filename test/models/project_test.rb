require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'create' do
    project = create :project
    assert project.persisted?
  end
end
