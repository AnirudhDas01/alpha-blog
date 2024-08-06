class CategoriesController  < ApplicationController
   before_action :require_admin, only: [:new, :create, :update, :edit]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if  @category.save
      flash[:notice] = "Category Created."
      redirect_to categories_path

    else
        render :new , status: :unprocessable_entity

    end
  end
  
  def update

  end

  def edit

  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin? )
      flash[:alert] = "You are not admin to perform the task"
      redirect_to categories_path
    end
  end


end
