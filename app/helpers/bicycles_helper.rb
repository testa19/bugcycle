module BicyclesHelper
  def sortable(column, name = nil)
    name ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to name, permitted_params.merge(sort: column, direction: direction, page: nil), {class: css_class, remote: true}
    # carries all parameters accross on link click (merges them with sort and direction params)
  end
end
