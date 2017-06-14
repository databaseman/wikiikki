Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  get  'about'       => 'welcome#about'
  get  'contact'     => 'welcome#contact'
  get  'help'        => 'welcome#help'
end
