module Whoops
  class Engine < Rails::Engine
    engine_name 'whoops'
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, File.expand_path("../../../app/assets/javascripts", __FILE__)
    end
  end
end
