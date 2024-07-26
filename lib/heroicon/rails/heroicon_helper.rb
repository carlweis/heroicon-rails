require "active_support/core_ext/string/output_safety"

module HeroiconHelper
  HEROICONS_PATH = File.expand_path("assets/heroicons", __dir__)

  # Returns an SVG icon from the Heroicons library with customizable dimensions.
  # @param name [String] the name of the icon
  # @param type [String] the style of the icon (default: "solid")
  # @param options [Hash] additional options including custom CSS classes
  # @return [String] HTML safe string with the SVG content or error message
  def heroicon(name, type: "solid", **options)
    # Allow strings or symbols for name and type arguments
    name = name.to_s
    type = type.to_s

    # Handle class attribute
    custom_class = options.delete(:class) || ""

    # Handle style attribute
    style_attribute = options.delete(:style)

    # Handle title attribute
    title_attribute = options.delete(:title)

    # Handle data- attributes, filtering out anything that doesn"t start with "data-"
    data_attributes = options.select { |key, _| key.to_s.start_with?("data-") }
    options.except!(*data_attributes.keys)

    # Load the SVG icon
    gem_root = Gem::Specification.find_by_name("heroicon-rails").gem_dir
    icon_path = File.join(gem_root, "lib", "heroicon", "rails", "assets", "heroicons", type, "#{name}.svg")
    icon_content = File.read(icon_path)
    icon_doc = Nokogiri::HTML::DocumentFragment.parse(icon_content)
    svg = icon_doc.at_css("svg")

    # Apply custom css classes
    custom_width_class = custom_class[/\bw-\d+/]
    custom_height_class = custom_class[/\bh-\d+/]
    default_width = custom_width_class ? "" : (type == "mini" ? "w-5" : "w-6")
    default_height = custom_height_class ? "" : (type == "mini" ? "h-5" : "h-6")
    css_classes = "#{default_width} #{default_height} #{custom_class}".strip
    svg[:class] = css_classes unless css_classes.empty?

    # Apply style attribute if present
    svg[:style] = style_attribute if style_attribute

    # Enhance accessibility
    svg[:role] = "img"
    svg["aria-labelledby"] = "#{name}-icon"
    title_element = Nokogiri::XML::Node.new("title", icon_doc)
    title_element.content = title_attribute || name.humanize
    title_element[:id] = "#{name}-icon"
    svg.prepend_child(title_element)

    # Add custom data- attributes
    data_attributes.each do |key, value|
      svg[key] = value
    end

    icon_doc.to_html.html_safe
  rescue StandardError => e
    "Icon #{name} not found. Error: #{e.message}"
  end
end
