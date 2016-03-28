class CoversController < ApplicationController

	def show
		book = Book.find(params[:id])
		respond_to do |format|
			format.jpg do
				cover = get_path_to_cover book.path
				send_file cover,type:'image/jpeg',filename: "cover.jpg",disposition: :inline
			end
		end
	end

	private 

	def get_path_to_cover path
		"/Users/thbounzer/data/Calibre Library/"+path+"/cover.jpg"
	end
end