class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @admin = Admin.first
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @admin = current_admin
    @admin_products = AdminsProduct.new
    respond_to do |format|
      if @product.save
        AdminsProduct.create(:admin_id => @admin.id, :product_id => @product.id)
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_product
    @product = Product.find_by_barcode(params[:id])
    if @product 
      result = { :success => "OK", :name => @product.name, :price => @product.price, :barcode => @product.barcode, :discount => @product.discount }
    else
    result = {:success => "failed" }
    end
   
 	render :json => result
   
  end
  
  def get_all_products
    user_id = params[:admin_id].to_i
    @admin_products = AdminsProduct.find(:all, :conditions => ["admin_id = ?", user_id])
    @test = params[:products].scan(/\d+/).map {|i| i.to_s }
    @products = Product.find_all_by_barcode(@test)
    render :json => @products
  end
  
  def WebModTotal
  	@items = params[:items].scan(/\d+/).map {|i| i.to_s }
  	@total = 0
  	@items.each do |item|
  		product = Product.find_by_barcode(item)
  		if product
  			@total = @total + product.price.to_i
  		end
  	end
  	render :json => { :total => @total }
  end
  
  def WebModPayment
  	@status = false
  	@items = params[:items].scan(/\d+/).map {|i| i.to_s }
  	user = Admin.find_by_token(params[:user_id])
  	if user
  		payment_history = PaymentHistory.new(:customer => user.name)
  	  	@total = 0  	  	
	  	@items.each do |item|
	  		product = Product.find_by_barcode(item)	  			  		
	  		if product
	  			@total = @total + product.price.to_i
	  		end
	  	end

		payment_history.items = params[:items]
	  	payment_history.total = @total
	  	@status = payment_history.save ? true : false
	  	
	  	render :json => { :status => @status }	 
  	else
	  	render :json => { :status => @status }	
  	end	

  end
  
end





