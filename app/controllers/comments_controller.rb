class CommentsController < ApplicationController


	def create
		@product = Product.find(params[:id])
		@comment = @prdouct.comments.new(comment_params)
		@comment.user = current_user 
		@comment.save
		redirect_to(@product)
	end


	def destroy
	end 


	private 

	def comment_params
		params.require(:comment).permit(:body, :rating, :user_id)
	end 
end
