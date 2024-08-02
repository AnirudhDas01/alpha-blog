class ArticlesController < ApplicationController
<<<<<<< HEAD

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
=======
 
  before_action :get_id, only: [:show, :edit, :update , :destroy]

def show
>>>>>>> udemy_follow_up

end
 def index
  @articles = Article.all
 end

 def new
  @article = Article.new
 end

  def create
<<<<<<< HEAD
=======

>>>>>>> udemy_follow_up
      @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article is Created sucessfully"
        redirect_to @article
      else
        render :new , status: :unprocessable_entity
      end
  end
def edit
<<<<<<< HEAD
  
end

def update 

=======

end

def update 
 
>>>>>>> udemy_follow_up
  if @article.update(article_params)
      redirect_to @article
      flash[:notice] = "Updated Successsfully"
  else
    render :new , status: :unprocessable_entity
  end

end

def destroy
<<<<<<< HEAD

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
  
=======
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
>>>>>>> udemy_follow_up

end
