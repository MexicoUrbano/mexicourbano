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

end
