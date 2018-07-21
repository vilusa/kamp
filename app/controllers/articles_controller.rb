class ArticlesController < ApplicationController
	# Article index all tüm verileri döndürür
	def index
    @articles = Article.all
  	end
	def show
    	@article = Article.find(params[:id])
  	end
  	def edit
  		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end

	#def create
  	#	@article = Article.new(params.require(:article).permit(:title, :text))
 
  	#	@article.save
  	#	redirect_to @article
	#end

	## Daha Temiz Şekilde Yazımı Permit alacağımız parametleri belirtir
	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
	  redirect_to @article
	  else
	  	render 'new'
	  end

	end

	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end
	 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end

	   
end
