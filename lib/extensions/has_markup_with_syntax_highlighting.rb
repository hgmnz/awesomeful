module HasMarkupWithSyntaxHighlighting
  module InstanceMethods

    SINGLE_LINE = '<code class="inline">%s</code>'
    MULTI_LINE = '<div><pre><code class="multiline">%s</code></pre></div>'
    SOURCE_TAG_REGEX = /<highlight(?:\:([a-z]+))?>(.+?)<\/highlight>/m
    CODERAY_OPTIONS = {:wrap => nil, :css => :class, :tab_width => 2}

    def generate_html_from_markdown_with_syntax_highlighting(markdown)
      unless markdown.blank?
        markdown = markdown.gsub(SOURCE_TAG_REGEX) do 
          lang = ($1 || :ruby).to_sym
          code = $2.strip
          code_markup = code =~ /\n/ ? MULTI_LINE : SINGLE_LINE
          code_markup % CodeRay.scan(code, lang).div(CODERAY_OPTIONS)
        end
        generate_html_from_markdown_without_syntax_highlighting(markdown)
      end
    end

  end

end

HasMarkup::Markdown::InstanceMethods.module_eval do
  include HasMarkupWithSyntaxHighlighting::InstanceMethods
  alias_method_chain :generate_html_from_markdown, :syntax_highlighting
end
  
