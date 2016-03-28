class BooksController < ApplicationController
	
	def index
		if params[:filter]
			@books = Book.where("title like '%#{params[:filter]}%'").page params[:page]
		else
			@books = Book.page params[:page]
		end
		respond_to do |format|
      		format.html
      		format.js
    	end
	end

	def show
		@book = Book.find(params[:id])
		@next_book = Book.where("id > #{@book.id}").first
		@prev_book = Book.where("id < #{@book.id}").last
		respond_to do |format|
			format.html
			format.pdf { get_format "PDF",@book.path }
			format.mobi { get_format "MOBI",@book.path }		
			format.epub { get_format "EPUB",@book.path }							
		end
	end

	private

	def get_path_to_book format,path,name
		lib_path = Rails.configuration.x.settings['calibre_lib']
		lib_path+path+"/"+name+"."+format
	end

	def get_format format,path
		file = @book.book_data.where(format: format).first
		path = get_path_to_book format.downcase,path,file.name
		send_file path,type:"application/#{format.downcase}",filename: file.name+"."+format.downcase,disposition: :inline
	end

end
