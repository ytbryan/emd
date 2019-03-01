module MarkdownTemplateHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.redcarpet_options
    @options = {
      space_after_headers:          true,
      fenced_code_blocks:           true,
      smartypants:                  true,
      disable_indented_code_blocks: true,
      prettify:                     true,
      tables:                       true,
      with_toc_data:                true,
      no_intra_emphasis:            true,
      autolink:                     true
    }
  end

  def self.markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, redcarpet_options)
  end

  def self.call(template)
    compiled_source = erb.call(template)
    "#{markdown.render(compiled_source).inspect}.html_safe"
  end
end

ActionView::Template.register_template_handler :md, MarkdownTemplateHandler
ActionView::Template.register_template_handler :markdown, MarkdownTemplateHandler
