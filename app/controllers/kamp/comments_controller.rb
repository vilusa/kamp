class Kamp::CommentsController < ApplicationController
  
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
	end


	 def index
	 	# N+ sorununu çözmek için includes eklenir sadece bir kere çeker
		@comments = Comment.includes(:article).limit(20)
	end

  	def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  	end
  	
	private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
