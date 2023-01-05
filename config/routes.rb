Rails.application.routes.draw do
  resources :answers
  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, shallow: true
    end
  end
end
