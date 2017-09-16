Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "welcome#index", as: :authenticated_root #need to change to post#index later
  end
  root 'welcome#index'
#  root to: "home#index"

  get  'about'       => 'welcome#about'
  get  'contact'     => 'welcome#contact'
  get  'help'        => 'welcome#help'
end
