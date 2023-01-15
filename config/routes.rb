# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, shallow: true do
    post :start, on: :member
    resources :questions, except: :index do
      resources :answers, shallow: true
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
