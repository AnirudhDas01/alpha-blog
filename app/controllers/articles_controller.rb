class ArticlesController < ApplicationController

  before_action :get_id, only: [:show, :edit, :update , :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy ]

def show

end
 def index
  @articles = Article.paginate(page: params[:page], per_page: 5)
 end

 def new
  @article = Article.new
 end

  def create

      @article = Article.new(article_params)
      @article.user = current_user
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
  redirect_to articles_path

end

private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def get_id
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or deleted your own Article"
      redirect_to articles_path
    end
  end
end
