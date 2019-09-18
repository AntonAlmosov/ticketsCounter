Rails.application.routes.draw do
  get 'ticket/index'
  root to: 'ticket#index'

  resources :tickets do
    get 'bought', to: 'ticket#bought', as: :bought
    get 'mistake', to: 'ticket#mistake', as: :mistake
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
