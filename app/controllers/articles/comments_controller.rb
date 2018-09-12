class Articles::CommentsController < ApplicationController
  #http_basic_authenticate_with name: "user", password: "password",only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
    @a = Article.find(params[:article_id])
    if(@comment.save)
      @flag = 1;
    else
      @flag = 0;
    end
    #redirect_to article_path(@article)
    respond_to do |format|  
            format.js { render 'comments/create'}
        end 
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @a = Article.find(params[:article_id])
    if(@comment.destroy)
      @flag = 2;
    else
      @flag = 3;
    end
    #redirect_to article_path(@article)
    respond_to do |format|  
            format.js { render 'comments/create'}
        end 
      #redirect_to article_path(@article)
    end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
