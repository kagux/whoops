module Whoops
  class Engine < Rails::Engine
    engine_name 'whoops'
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, File.expand_path("../../../app/assets/javascripts", __FILE__)
    end
  end


  module Routes
    def self.draw(map)
      map.instance_exec do
        resources :event_groups, :as => "whoops_event_groups" do
          resources :events
        end

        resources :events, :as => "whoops_events"
        match '/', :to => "event_groups#index", :as => "whoops_root"
      end
    end

    def self.draw_new_event_route(map)
      map.instance_exec do
        match 'events', :via => [:post], :to => 'events#create', :as=>"whoops_new_event"
      end
    end
  end


end
