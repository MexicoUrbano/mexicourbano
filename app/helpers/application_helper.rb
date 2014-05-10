module ApplicationHelper

  def is_active?(page_name)
    "class=\"active\"" if request.path_info.include?(page_name)
  end

  def userable_path
    eval "#{current_user.userable_type.downcase}_path(current_user.userable_id)"
  end

  def edit_userable_path
    eval "edit_#{current_user.userable_type.downcase}_path(current_user.userable_id)"
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
