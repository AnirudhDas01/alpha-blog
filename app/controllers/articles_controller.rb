class ArticlesController < ApplicationController
def show
  @article = Article.find(params[:id])
end
 def index
  @articles = Article.all
 end

 def new
  @article = Article.new
 end

  def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "Article is Created sucessfully"
        redirect_to @article
      else
        render :new , status: :unprocessable_entity
      end
  end
def edit
  @article = Article.find(params[:id])
end

def update 
@article = Article.find(params[:id])
  if @article.update(params.require(:article).permit(:title, :description))
      redirect_to @article
      flash[:notice] = "Updated Successsfully"
  else
    render :new , status: :unprocessable_entity
  end

end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to @article

end
  

end
