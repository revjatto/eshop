class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout, :buy]
  
  def index
    @products = Product.all.order('created_at DESC')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      
      redirect_to @product
      
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
      
    else
      
      render 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to products_path
  end
  
  def checkout
    @product = Product.find(params[:id])
  end
  
  def buy
   @product = Product.find(params[:id])
   
  @product.buy_by(current_user)
     
     redirect_to @product, notice: "You purchase #{@product.name}" 
  
  end
  
  protected
  
  def product_params
    params.require(:product).permit(:name, :price, :image_url, :stock)
  end
  
end
