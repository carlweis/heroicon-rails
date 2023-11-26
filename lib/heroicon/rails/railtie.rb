require "rails"

module Heroicon
  module Rails
    class Railtie < Rails::Railtie
      initializer "heroicon.view_helpers" do
        ActionView::Base.include HeroiconHelper
      end
    end
  end
end
