# frozen_string_literal: true

require_relative "rails/version"
require_relative "rails/railtie" if defined?(Rails)
require "nokogiri"
require "heroicon/rails/heroicon_helper"

module Heroicon
  module Rails
    class Error < StandardError; end
  end
end
