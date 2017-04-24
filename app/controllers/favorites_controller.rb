class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:post_id])
    current_user.favorite_on(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:post_id])
    current_user.favorite_off(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
end