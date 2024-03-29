# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'},
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index  do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  root 'tests#index'

  resources :feedbacks, only: %i[new create]
  get 'user_badges/index'

  namespace :admin do
    post 'badges/select'
    resources :gists, only: :index
    resources :badges, only: :index

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

  end
end
