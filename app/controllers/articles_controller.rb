class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show

end
 def index
  @articles = Article.all
 end

 def new
  @article = Article.new
 end

  def create
      @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article is Created sucessfully"
        redirect_to @article
      else
        render :new , status: :unprocessable_entity
      end
  end
def edit
  
end

def update 

  if @article.update(article_params)
      redirect_to @article
      flash[:notice] = "Updated Successsfully"
  else
    render :new , status: :unprocessable_entity
  end

end

def destroy

  @article.destroy
  redirect_to @article

end

private

def set_article
  @article = Article.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :description)
end
  

end
