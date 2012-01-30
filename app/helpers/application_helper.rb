module ApplicationHelper
  def title
    base_title = "RoomFinder"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : nil
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
end
