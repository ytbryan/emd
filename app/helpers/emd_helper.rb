module EmdHelper
  def emd content
    Markdown.new(content).to_html.html_safe
  end
end
