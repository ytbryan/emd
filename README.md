# Embedded Markdown [![Gem Version](https://badge.fury.io/rb/emd.svg)](https://badge.fury.io/rb/emd)

Embedded Markdown uses a Rails engine and a simple initializer to initiate a markdown template handler with the help of Redcarpet and syntax highlighting from Coderay.

The motivation is to reuse Markdown file in several of my Rails projects.

- 😊 Reuse Markdown in Rails products
- 📝 Allow copywriters & marketers to be involved in building your content easily 
- 📝 Allows you to focus on the content instead of the webpage structure.  
- 🙌 Supports syntax highlighting via Coderay

## Installation

Add this two lines to your application's Gemfile:

```ruby
gem 'coderay' #optional for Syntax Highlighting
gem 'redcarpet'
gem 'emd'
```
> emd depends on Redcarpet for Markdown rendering

And then execute:

    $ bundle

## Usage

### A Markdown view

1. Create a view called app/view/home/markdown.html.md and add the following sample Markdown. 

    ```markdown
        ## This is a sample Markdown code
        - [google](http://google.com)
        - [emd](https://github.com/ytbryan/emd/)
    ```

1. Generate a home controller using the following command `rails generate controller home`

1. At route.rb, add the following line: 
    ```
       get '/markdown', to: 'home#markdown'
    ```
1. Finally, visit the markdown view at [http://localhost:3000/markdown](http://localhost:3000/markdown)


### A Markdown partial

1. Create a partial app/view/home/`_component.html.md`

    ```markdown
        ### This is a component

        - This is item 1
        - This is iiem 2
        - [This is a link to google] (http://google.com)
    ```

1. Then,  use this partial using `<%= render "component" %>` within any view like index.html.erb

### Syntax Highlighting

To support syntax highlighting, add `coderay` to Gemfile as shown below: 

```ruby
gem 'coderay'
```
Remember to run `bundle install`. 

This will turn all the code block into:

```ruby
    ```ruby
       class Something
       end
    ```
```

```ruby
    class Something
    end
  ```

### Control which extensions Redcarpet uses

`emd` assumes some sane redcarpet extension use (see redcarpets options [here](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) and [here](https://github.com/vmg/redcarpet#darling-i-packed-you-a-couple-renderers-for-lunch)). If you need to overwrite these in your Rails app, create a file `config/initializers/markdown_template_handler.rb` to overwrite the defaults from [config/initializers/markdown_template_handler.rb](config/initializers/markdown_template_handler.rb) like this:

```
module MarkdownTemplateHandler
  def self.call(template)
    compiled_source = erb.call(template)
    "Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                             no_intra_emphasis: true,
                             fenced_code_blocks: true,
                             # I actually like that, so commented it out:
                             # disable_indented_code_blocks: true,
                             space_after_headers: true,
                             prettify:                     true,
                             tables:                       true,
                             with_toc_data:                true,
                             autolink: true).render(begin;#{compiled_source};end).html_safe"
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ytbryan/emd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Special thanks to [these folks](http://stackoverflow.com/questions/4163560/how-can-i-automatically-render-partials-using-markdown-in-rails-3/10131299#10131299
) for making emd possible
