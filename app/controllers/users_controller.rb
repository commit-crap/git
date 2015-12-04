class UsersController < ApplicationController
 load_and_authorize_resource

  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!

  # GET /users
  def index
    @users ||= User.all
    @users = make_paginate(@users)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      render action: 'new'
    end
  end

  def search
    @users = ::User::FinderService.find(search_params)
    @users = make_paginate(@users)
    render action: 'index'
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      @user.update_without_password(user_params_without_password)
    else
      @user.update(user_params)
    end

    if @user.valid?
      if @user == current_user
        sign_in(@user, bypass: true)
      end

      redirect_to users_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário excluído.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
  end

  def search_params
    params.require(:search).permit(:type, :text)
  end

  def user_params_without_password
    user_params.delete(:password)
    user_params.delete(:password_confirmation)
    user_params
  end

  def make_paginate(list)
    per_page = params[:per_page] if params[:per_page].present?
    list.paginate(page: params[:page], per_page: per_page)
  end
end
