module MarkdownTemplateHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template)
    options = {
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
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    compiled_source = erb.call(template)
    "#{@markdown}.render(begin;#{compiled_source};end).html_safe"
  end
end

ActionView::Template.register_template_handler :md, MarkdownTemplateHandler
ActionView::Template.register_template_handler :markdown, MarkdownTemplateHandler
