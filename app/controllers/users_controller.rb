class UsersController < ApplicationController
  before_filter :current_resource, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(permitted_params.user)
    if @user.save
      sign_in @user
      flash[:success] = "User created successfully"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

    def current_resource
      @user = User.find(params[:id])
    end

end