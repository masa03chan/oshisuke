Rails.application.routes.draw do

  namespace :public do

  end

  namespace :admin do
    resources :contents, expect: [:edit, :update] do
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
      resources :events, expect: [:destroy] do
        collection do
          get 'search' #eventsの検索用
        end
        resources :bookmarks, only: [:create, :index, :destroy]
      end
    end
    get "users/mypage" => "users#show", as: "user"
    get "users/infomation/edit" => "users#edit", as: "edit_public_user"
    patch "users/infomation" => "users#update", as: "update_public_user"
    get "users/delete_confirm" => "users#delete_confirm"
    patch "users/delete" => "users#delete_process"

  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
