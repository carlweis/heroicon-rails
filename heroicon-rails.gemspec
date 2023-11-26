# frozen_string_literal: true

require_relative "lib/heroicon/rails/version"

Gem::Specification.new do |spec|
  spec.name = "heroicon-rails"
  spec.version = Heroicon::Rails::VERSION
  spec.authors = ["Carl Weis"]
  spec.email = ["carl@carlweis.com"]

  spec.summary = "A Ruby gem providing a helper for easily embedding Heroicons SVG icons in Rails applications."
  spec.description = "This gem simplifies the process of using Heroicons, a popular SVG icon library, in Ruby on Rails applications. It offers a convenient helper method that allows developers to easily embed any Heroicon with customizable types (solid, outline, or mini) and additional CSS classes. The gem aims to enhance the visual appeal and user interface design of Rails applications with minimal effort."
  spec.homepage = "https://github.com/carlweis/heroicon-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/carlweis/heroicon-rails"
  spec.metadata["changelog_uri"] = "https://github.com/carlweis/heroicon-rails/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0") +
    Dir.glob("lib/heroicon/rails/assets/heroicons/**/*").reject { |f| File.directory?(f) }
  end.reject do |f|
    (File.expand_path(f) == __FILE__) ||
    f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency "activesupport", ">= 5.2.7"
  spec.add_dependency "nokogiri", ">= 1.15.5"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
