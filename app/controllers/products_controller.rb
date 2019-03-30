class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功将#{@product.title}加入购物车"
  else
    flash[:warning] = "你的购物车内已有此物件"
  end
    redirect_to :back
  end

  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @product=Product.find(params[:id])
    @product.downvote_by current_user
    redirect_to :back
  end

  def favorite
    @product = Product.find(params[:id])
    current_user.favorite_products << @product
    flash[:notice] = "您已收藏宝贝"
    redirect_to :back
  end

  def unfavorite
    @product = Product.find(params[:id])
    current_user.favorite_products.delete(@product)
    flash[:notice] = "您已取消收藏宝贝"
    redirect_to :back
  end
end
