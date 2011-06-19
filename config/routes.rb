Rails.application.routes.draw do
  namespace :admin do
    resources :products do
      resources :specials, :controller => :product_specials
    end
    resources :specials
  end
end
