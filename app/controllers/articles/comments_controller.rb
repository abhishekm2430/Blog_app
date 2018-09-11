class Articles::CommentsController < ApplicationController
  #http_basic_authenticate_with name: "user", password: "password",only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    #redirect_to article_path(@article)
    respond_to do |format|  
            format.js { render 'articles/show_updated'}
        end 
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end