class UserCategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def index
    @categories = Category.all
    @user_categories = UserCategory.all
  end

  def new
    @user_category = UserCategory.new
  end

  def create
    @user_category = UserCategory.new(category_params)
    @user_category.user = current_user

    if @user_category.save
      redirect_to user_categories_path
    else
     render :new
    end
  end

  def destroy
    @user_category.destroy
    redirect_to user_categories_path
  end

  private

  def category_params
    params.require(:user_category).permit(:name)
  end

  def set_category
    @user_category = UserCategory.find(params[:id])
  end
end
