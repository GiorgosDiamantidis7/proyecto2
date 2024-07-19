class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    @list = List.find(params[:list_id])
    @product.list_id = @list.id
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private
  def set_products
    @product= Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :price, :quantity, :list_id, :unit_id)
  end

end
