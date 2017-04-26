module ApplicationHelper
  def nice_child_link(child)
    link_to child.name, childern_path(child) if child
  end
end
