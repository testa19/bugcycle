module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
      attributes["class"] = "hidden"
    end
    content_tag("div", attributes, &block)
  end
  def filter_chbox_option(filter_name, filter_value)
    id = filter_name.to_s.singularize
    flag = (params[filter_name].include? filter_value.to_s) unless params[filter_name].nil?

    check_box_tag "#{filter_name}[]", filter_value, flag, {id: id }    
  end
end
