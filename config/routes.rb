Rails.application.routes.draw do
  resources :sample_forms
  root 'application#hello'
end
