class ProductsController < ApplicationController
  before_filter :current_resource, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(permitted_params.product)
    if @product.save
      flash[:success] = "Product was created successfully"
      redirect_to @product
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
      if @product.update_attributes(permitted_params.product)
        flash[:success] = "Product was updated successfully"
        redirect_to @product
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    if @product.destroy
      flash[:success] = 'Product was deleted successfully'
      redirect_to products_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to products_url
    end
  end

  private

    def current_resource
      @product = Product.find(params[:id])
    end
end