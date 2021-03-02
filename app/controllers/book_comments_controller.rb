class BookCommentsController < ApplicationController

  def create
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    book = Book.find(params[:book_id])
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
