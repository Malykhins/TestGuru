Rails.application.routes.draw do
  resources :tests, except: [:index], shallow: true do
    resources :questions
  end
end
