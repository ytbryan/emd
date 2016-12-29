# Embedded Markdown

Embedded Markdown uses a rails engine and a simple initializer to initiate a template handler for markdown using redcarpet.

The motivation to create Embedded Markdown as a gem, so that I can use reuse markdown in several of my Rails & Jekyll projects.

Special thanks to [these folks](http://stackoverflow.com/questions/4163560/how-can-i-automatically-render-partials-using-markdown-in-rails-3/10131299#10131299
) for making emd possible

## Benefits
1. Reuse markdown through out Rails and even Jekyll Projects
1. Allow copywriters & marketers to be involved in building your content easily 
1. Allows you to focus on the content instead of the webpage structure.  

## Example repo

TODO

## Installation

Add this two lines to your application's Gemfile:

```ruby
gem 'redcarpet'
gem 'emd'
```
> emd depends on redcarpet for markdown rendering

And then execute:

    $ bundle

## Usage

### A markdown view

1. Create a view called app/view/home/markdown.html.md and add the following sammple markdown. 

    ```markdown
        ## This is a sample markdown code
        - [google][http://google.com]
        - [emd](https://github.com/ytbryan/emd/)
    ```

1. `rails generate controller home`

1. At route.rb, add the following line: 
    get '/markdown', to: 'home#markdown'

1. Visit the app at http://localhost:3000/markdown


### A markdown partial

1. create a partial app/view/home/`_component.html.md`

    ```markdown
        ### This is a component

        - This is item 1
        - This is iiem 2
        - [This is a link to google] (http://google.com)
    ```

1. Then,  use this partial using <%= render "component" %> within any view like index.html.erb


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/emd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
