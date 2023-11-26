# heroicon-rails

## Introduction
heroicon-rails is a Ruby on Rails gem that simplifies the integration of Heroicons - a set of free, MIT-licensed high-quality SVG icons - into Rails applications. This gem provides a straightforward way to include and use Heroicons in Rails views, offering both ease of use and customization.

## Features
- Effortless integration of Heroicons into Rails applications.
- Customizable options for icon types (solid, outline) and default styling classes.

## React/Vue

If you're using React or VueJS for your application or want to use heroicons in your components, you should use the [official heroicons library](https://github.com/tailwindlabs/heroicons).

## Installation
Add this line to your application's Gemfile:

```ruby
gem "heroicon-rails"
```

And then execute:

```bash
bundle install
```

## Tailwind CSS Integration
### Default Sizing with Tailwind CSS

The `heroicon-rails` gem leverages [Tailwind](https://tailwindcss.com/) CSS for styling icons. By default, icons are sized using the classes `w-5` and `h-5`, which set the `width` and `height` of the icons to `1.25rem` (`20px`) respectively. This default sizing ensures that the icons fit well in most user interfaces without additional adjustments.

### Customizing Icon Size
While the default size works for many cases, you might want to customize the dimensions of the icons to better fit your application's design. You can easily override the default sizing by specifying your own CSS classes when using the heroicon helper. For instance:

**erb**
```erb
<%= heroicon "icon-name", class: "w-10 h-10" %>
```

**slim**
```slim
= heroicon "icon-name", class: "w-10 h-10"
```

In this example, `w-10` and `h-10` are Tailwind CSS classes that set the icon's `width` and `height` to `2.5rem` (`40px`) each. You can use any CSS class or inline style to customize the size, color, or any other property of the icons.

### Non-Tailwind CSS Projects

If you're not using Tailwind CSS in your project, you can still customize icons using your own CSS. Simply define the classes you want to use and pass them to the heroicon helper method. For example, if you have a CSS class `.custom-icon-size`, you can apply it like so:

**erb**
```erb
<%= heroicon "icon-name", class: "custom-icon-size" %>
```
**slim**
```slim
= heroicon "icon-name", class: "custom-icon-size"
```

This approach provides flexibility, allowing heroicons to seamlessly integrate into various projects, regardless of the CSS framework or methodology being used.

## Usage

### Displaying an Icon
You can display an icon using the heroicon helper in your views. For example:

**erb**
```erb
<%= heroicon "name", type: :outline, class: "additional-classes" %>
```
**slim**
```slim
heroicon "name", type: :outline, class: "additional-classes"
```
- `name`: The name of the Heroicon you wish to use (e.g., arrow-down, users).
- `type`: `"solid"`, `"outline"`, or `"mini"`. (defaults to `:solid`).
- `class`: Additional CSS classes you want to add (defaults to `"h-6 w-6"` for `solid` and `outline`, and `"h-5 w-5"` for `mini`) to set the default size using Tailwind CSS classes.

## Contributing
Contributions are welcome, especially in the following areas:

- Improving integration and configuration options.
- Bug reports and fixes.

## License
This gem is available as open-source under the terms of the MIT License.

## Acknowledgments
- [heroicons](https://heroicons.com/) for making an excellent set of icons.
- [Tailwind CSS](https://tailwindcss.com) for making an awesome way to do CSS.
- Rails community for ongoing support and contributions.
