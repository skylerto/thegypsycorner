class ArtistsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @portfolios = Artists::Portfolio.where(user_id: params[:id])
  end
end
