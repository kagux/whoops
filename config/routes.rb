Whoops::Engine.routes.draw do
  resources :event_groups, :as => "event_groups" do
    resources :events
  end
  
  resources :events, :as => "events"
  root :to => "event_groups#index"
end