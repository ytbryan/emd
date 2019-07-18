class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    if !Gem.loaded_specs.has_key?('coderay') ||  language == nil || language == "" 
      %(<pre>#{code}</pre>)
    else 
      CodeRay.scan(code, language).div 
    end
  end
end

module MarkdownTemplateHandler  
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template)
    compiled_source = erb.call(template)
    
    %(Redcarpet::Markdown.new(CodeRayify.new(:filter_html => false, 
                                            :hard_wrap => true),
                            no_intra_emphasis:            true,
                            fenced_code_blocks:           true,
                            space_after_headers:          true,
                            smartypants:                  true,
                            disable_indented_code_blocks: true,
                            prettify:                     true,
                            tables:                       true,
                            with_toc_data:                true,
                            autolink:                     true
                          ).render(begin;#{compiled_source};end).html_safe)
                          
  end
end

ActionView::Template.register_template_handler :md, MarkdownTemplateHandler
ActionView::Template.register_template_handler :markdown, MarkdownTemplateHandler
