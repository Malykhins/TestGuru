# frozen_string_literal: true

Rails.application.routes.draw do
  #  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }
  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, shallow: true do
    post :start, on: :member
    resources :questions, except: :index do
      resources :answers, shallow: true
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  root 'tests#index'

end
