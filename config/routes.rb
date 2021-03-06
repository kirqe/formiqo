Rails.application.routes.draw do
  root to: 'pages#index'

  devise_for :users,
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations',
      passwords: 'passwords'
    },
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    }

  post '/m/:token', to: 'messages#create', as: :external_message

  resources :subscriptions, only: [:index, :create, :update]
  resources :mailboxes do
    resources :messages, only: [:index, :create, :destroy]
    member do
      post 'clear_messages', to: 'mailboxes#clear_messages'
    end
  end

  post 'auth' => 'user_token#create'
  namespace :admin do
    resources :users
    get 'dashboard', to: "dashboard#index", as: :dashboard
    get 'fetch_data', to: "dashboard#fetch_data"
  end

  namespace :api, defaults: { format: :json } do
    resources :mailboxes, only: [:index, :show]
  end

  # post '/checkout', to: 'payment#checkout'
  get '/execute', to: 'payment#execute'
  get 'pages/index'
  get 'pages/help'
  get 'pages/terms'
  get 'thank_you', to: 'pages#thank_you'

  get '*path', to: 'application#e_404'
end
