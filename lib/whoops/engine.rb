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
        resources :event_groups, :as => "event_groups" do
          resources :events
        end

        resources :events, :as => "events"
        root :to => "event_groups#index"
      end
    end
  end


end
