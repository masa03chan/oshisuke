Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :contents, only: [:index, :edit, :update] do
      collection do
        get 'search' #contentsの検索用
      end
      resource :content_followings, only: [:index] #コンテンツのフォロー用
      resources :events, only: [:destroy]
    end
    resources :end_users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :contents do
      collection do
        get 'search' #contentsの検索用
      end
      resource :content_followings, only: [:create, :destroy] #コンテンツのフォロー用
      resources :events, except: [:destroy] do
        collection do
          get 'search' #eventsの検索用
        end
        resource :bookmarks, only: [:create, :destroy] #マイイベントカレンダー登録用
      end
    end
    get "end_users/mypage" => "end_users#show", as: "end_user"
    get "end_users/infomation/edit" => "end_users#edit", as: "edit_public_end_user"
    patch "end_users/infomation" => "end_users#update", as: "update_public_end_user"
    get "end_users/delete_confirm" => "end_users#delete_confirm"
    patch "end_users/delete" => "end_users#delete_process"
    get 'end_users/:id/follows', to: 'end_users#follows', as: "follows_end_user"
    get 'end_users/:id/followers', to: 'end_users#followers', as: "followers_end_user"
      #ユーザー同士のフォロー機能（今後実装予定）
    post 'end_users/:end_user_id/relationships', to: 'relationships#create', as: "end_user_relationships"
    delete 'end_users/:end_user_id/relationships', to: 'relationships#delete'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
