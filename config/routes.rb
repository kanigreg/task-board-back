# frozen_string_literal: true

Rails.application.routes.draw do
  get 'todos/create'
  get 'todos/update'
  root to: 'projects#index'

  resources :projects, only: :index
end
