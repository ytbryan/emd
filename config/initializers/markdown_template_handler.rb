module MarkdownTemplateHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template, source)
    compiled_source = erb.call(template, source)
    "Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                             no_intra_emphasis: true,
                             fenced_code_blocks: true,
                             space_after_headers: true,
                             smartypants:                  true,
                             disable_indented_code_blocks: true,
                             prettify:                     true,
                             tables:                       true,
                             with_toc_data:                true,
                             autolink: true).render(begin;#{compiled_source};end).html_safe"
  end
end

ActionView::Template.register_template_handler :md, MarkdownTemplateHandler
ActionView::Template.register_template_handler :markdown, MarkdownTemplateHandler
