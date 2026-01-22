Rails.application.routes.draw do
root to: 'lists#index'
  # - As a user, I can see all my movie lists (index)
  # - As a user, I can see the details of a movie list (show)
  resources :lists, only: [:index, :show, :new, :create] do
    # - As a user, I can bookmark a movie inside a movie list (create, new)
    resources :bookmarks, only: [:new, :create]
  end




end
