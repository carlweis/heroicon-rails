require 'active_support/core_ext/string/output_safety'

module HeroiconHelper
  HEROICONS_PATH = File.expand_path("assets/heroicons", __dir__)

  def heroicon(name, type: "solid", **options)
    css_classes = options.delete(:class) || ""

    gem_root = Gem::Specification.find_by_name("heroicon-rails").gem_dir
    file_path = File.join(gem_root, "lib", "heroicon", "rails", "assets", "heroicons", type, "#{name}.svg")
    svg_content = File.read(file_path)
    doc = Nokogiri::HTML::DocumentFragment.parse(svg_content)
    svg = doc.at_css("svg")
    default_css = type == "mini" ? "w-5 h-5" : "w-6 h-6"
    css_classes = "#{default_css} #{css_classes}".strip
    svg[:class] = css_classes unless css_classes.empty?

    doc.to_html.html_safe
  rescue StandardError
    "heroicon '#{name}' not found"
  end
end
