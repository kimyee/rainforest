class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

 #  def show
 #  	@product = Product.find(params[:id]) 
 #  end

  def new
  	@product = Product.new #gives you a form to create
  end 

	# def create
	# 	@product = Product.new(params[:product])

	# 	if @product.save
	# 		redirect_to products_url
	# 	else
	# 		render :new
	# 	end
	# end
	
	# def edit
	# 	@product = Product.find(params[:id]) #gives you a form to update 	
	# end 
	
	# def update
	# 	@product = Product.find(params[:id])
			
	# 		if @product.update_attribute(params[:product])
	# 			redirect_to product_path(@product)
	# 		else
	# 			render :edit
	# 		end
	# end
end
