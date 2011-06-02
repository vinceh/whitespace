module ApplicationHelper
	
	def embed(s)
		if s.mediatype == "video"
			return s.content.html_safe
		elsif s.mediatype == "photo"
			return image_tag s.content
		elsif s.mediatype == "link"
			return link_to "Read full story", s.content
		end
	end
	
	def getMediaTypes
		return ["video", "photo","link"]
	end
end
