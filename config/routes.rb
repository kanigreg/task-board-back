# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects, only: :index do
    resources :todos, only: :update
  end
  resources :todos, only: :create
end
