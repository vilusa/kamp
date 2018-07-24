class ArticlesController < ApplicationController
	 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	# Article index all tüm verileri döndürür
	def index
		# title params q araması yapalım
		#if params[:q].present? # present boş olup olmadığını kontrol eder boş ise if çalışmaz 
		#	@articles = Article.where(title: params[:q])
		#else
    	#@articles = Article.includes(:comments).all
    	#end
    	@articles = Article.all
    	respond_to do |format|
    		format.html # index.html.erb
    		format.xml { render xml: @articles} #article.json json çıktı verir
    		format.json { render json: @articles } #article.xml xml çıktı verir
    	end

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

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])

		@article.destroy

		redirect_to articles_path
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

	
	 
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end

	   
end
