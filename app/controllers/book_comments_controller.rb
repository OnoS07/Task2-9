class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = BookComment.new(book_comment_params)
		@comment.user_id = current_user.id
		@comment.book_id = @book.id
		if @comment.save
			render :index
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.find_by(book_id: @book.id)
		@comment.destroy
	end

	protected
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end
