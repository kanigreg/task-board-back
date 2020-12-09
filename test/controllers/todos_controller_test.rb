require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test 'should get create' do
    project = create(:project)
    attr = {
      text: generate(:string),
      project_id: project.id
    }

    assert_changes -> { Todo.count } do
      post :create, params: { todo: attr }
    end

    assert_response :created
  end

  test 'should not found' do
    attr = { project_id: 2020 }

    post :create, params: { todo: attr }

    assert_response :not_found
  end

  test 'should bad request' do
    project = create(:project)
    attr = { project_id: project.id }

    post :create, params: { todo: attr }

    assert_response :bad_request
  end

  test 'should get update' do
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
