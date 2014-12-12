class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: :follow_category

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def follow_category
    raise Exception("can't follow unless signed in") unless user_signed_in?
    category = Category.find(params[:category_id])
    if current_user.categories.include? category
      current_user.categories.delete category
    else
      current_user.categories << category
    end
    current_user.save
    redirect_to categories_path
  end

  private

  def secure_params
    params.require(:user).permit(:role, {category_ids: []})
  end

end
