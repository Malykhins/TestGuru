# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'  },
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index  do
    post :start, on: :member
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  root 'tests#index'

  namespace :admin do
    resources :tests
  end

end
