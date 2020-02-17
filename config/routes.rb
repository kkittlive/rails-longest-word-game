Rails.application.routes.draw do
  # get 'games/new'
  # get 'games/score'
  get 'new', to: 'games#new', as: 'new'
  get 'score', to: 'games#new', as: 'newgame'
  post 'score', to: 'games#score', as: 'score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
