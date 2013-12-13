Frugalistas::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  resources :convos do
    resources :messages
  end
  resources :messages

  resources :transactions
  resources :trusts do 
    resource :transactions  
  end

  root :to => "users#show"
end
