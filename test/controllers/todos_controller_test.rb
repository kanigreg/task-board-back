require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test 'should post create' do
    project = create(:project)
    attr = {
      text: generate(:string)
    }

    assert_changes -> { Todo.count } do
      post :create, params: { project_title: project.title, todo: attr }
    end

    assert_response :created
  end

  test 'should post create in new project' do
    project = create(:project)
    attr = {
      text: generate(:string)
    }

    assert_changes -> { Todo.count } do
      post :create, params: { project_title: 'non-existent title', todo: attr }
    end

    assert_response :created
  end

  test 'should bad request' do
    project = create(:project)

    post :create

    assert_response :bad_request
  end

  test 'should put update' do
    todo = create(:todo)
    attr = {
      text: generate(:string),
      is_completed: true
    }

    put :update, params: { id: todo.id, project_id: todo.project_id, todo: attr }

    todo.reload
    assert_response :success
    assert_equal attr[:text], todo.text
    assert_equal attr[:is_completed], todo.is_completed
  end
end
