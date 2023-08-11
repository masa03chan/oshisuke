Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :admin do
    resources :contents, except: [:edit, :update] do
      collection do
        get 'search' #contentsの検索用
      end
      resources :events, only: [:index, :show, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :contents do
      collection do
        get 'search' #contentsの検索用
      end
      resources :events, except: [:destroy] do
        collection do
          get 'search' #eventsの検索用
        end
        resources :bookmarks, only: [:create, :index, :destroy]
      end
    end
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
