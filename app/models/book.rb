class Book < ActiveRecord::Base
	has_many :book_data, foreign_key: "book"
	paginates_per 25 
end