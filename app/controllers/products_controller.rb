class ProductsController < ApplicationController
	before_filter :ensure_logged_in, :only => [:show]
  respond_to :html, :json
  
  def index
  	@products = Product.all

  	respond_with @products
  end

  def show
  	@product = Product.find(params[:id]) 

  	respond_with @product

  	if current_user
    @review = @product.reviews.build
  end

  def new
  	@product = Product.new #gives you a form to create

  	respond_with @product
  end 

	def create
		@product = Product.new(params[:product])

		
		if @product.save
				respond_with @product, location: @product, notice: "Yeay.", status: :created
		else
			respond_with @product do |format|
				format.html { render action: "new" }
			end
		end
	end
	
	def edit
		@product = Product.find(params[:id]) #gives you a form to update 	
	end 
	
	def update
		@product = Product.find(params[:id])
		
		respond_to do |format|	
			if @product.update_attribute(params[:product])
				format.html { redirect_to @product, notice: 'Product was successfully updated'}
				format.json { head :no_content}
			else
				format.html { render action: "edit"}
				format.json { render json: @product.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		respond_to do |format|
			format.html { redirect_to products_url}
			format.json { head :no_content}
		end
	end
end
