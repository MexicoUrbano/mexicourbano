module ApplicationHelper
  
	def is_active?(page_name)
    "class=\"active\"" if request.path_info.include?(page_name)
  end

  
end
