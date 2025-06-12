module ApplicationHelper
	def page_courant(path, page)
		if path == page 
			return "active"
		else
			return nil
		end
	end
end
