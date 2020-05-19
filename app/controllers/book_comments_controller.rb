class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		book_comment = BookComment.new(book_comment_params)
		book_comment.user_id = current_user.id
		book_comment.book_id = book.id
		if book_comment.save
			flash[:notice] = "コメントを投稿しました！"
			redirect_to book_path(book)
		elsif book_comment.comment.empty?
			flash[:comment] = "コメントを入力してください"
			redirect_to book_path(book)
		else
			flash[:comment] = "コメントは50文字以下までです"
			redirect_to book_path(book)
		end
	end

	protected
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end
