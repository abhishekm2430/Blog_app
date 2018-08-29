class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "user", password:"password",except:[:index, :show]
  before_filter :authenticate_user!
  include Ability
	def index
		#binding.pry
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit

		@article = Article.find(params[:id])
	end

	def create
		@author = User.find(current_user.id)
		@article = @author.articles.create(article_params)
		if(@article.save)
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		#if @article.user_id == current_user.id
		if Person.can_do?(@article.user_id, current_user.id)
			if @article.update(article_params)
				redirect_to @article 
			else
				render 'edit'
			end
		else
			flash[:error]="You are not authorized for this operation!!!"
			redirect_to article_path
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if current_user.email == "admin@gmail.com"
			@article.destroy
		else
			@article.isactive = 1
			@article.save
		end
		#@article.destroy
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title,:text)
	end
end
#working in feture branch