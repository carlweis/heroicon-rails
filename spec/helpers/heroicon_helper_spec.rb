require "spec_helper"
require "nokogiri"

RSpec.describe HeroiconHelper, type: :helper do
  include HeroiconHelper
  describe "#heroicon" do
    it "returns the correct HTML for a valid icon" do
      icon_name = "bolt"
      html = heroicon(icon_name)
      expect(html).to include("<svg")
      expect(html).to include("class=\"w-6 h-6\"")
    end

    it "returns an empty string for an invalid icon" do
      invalid_icon_name = "invalid-icon"
      expect(heroicon(invalid_icon_name)).to eq("heroicon 'invalid-icon' not found")
    end

    it "applies custom classes" do
      icon_name = "bolt"
      icon_class = "custom-class"
      html = heroicon(icon_name, class: icon_class)
      expect(html).to include("class=\"w-6 h-6 #{icon_class}\"")
    end

    it "handles mini type" do
      icon_name = "bolt"
      html = heroicon(icon_name, type: "mini")
      expect(html).to include("class=\"w-5 h-5\"")
    end
  end
end
