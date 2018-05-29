module ApplicationHelper
  def markdown(text)
      options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
      }

      extensions = {
        autolink:           true,
        superscript:        true,
        fenced_code_blocks: true,  #这句放在这里代码块才能正确显示
        lax_spacing: true,   #解决普通文字与代码块直接必须空行才能markdown显示的bug
        tables: true,      #增加表格显示功能
        disable_indented_code_blocks: true
      }
      if text.blank?
        nil
      else
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end
  end
end
