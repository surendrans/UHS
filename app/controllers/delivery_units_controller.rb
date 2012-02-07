class DeliveryUnitsController < ApplicationController
before_filter :get_pickup_and_delivery
  
  def get_pickup_and_delivery
  @pickup = Pickup.find(params[:pickup_id])
  @delivery = Delivery.find(params[:delivery_id])
  end
  
  def index
    @delivery_units = @delivery.delivery_units.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @delivery_units }
    end
  end

  # GET /delivery_units/1
  # GET /delivery_units/1.xml
  def show
    @delivery_unit = DeliveryUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @delivery_unit }
    end
  end

  # GET /delivery_units/new
  # GET /delivery_units/new.xml
  def new
  
    @delivery_unit = DeliveryUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @delivery_unit }
    end
  end

  # GET /delivery_units/1/edit
  def edit
    @delivery_unit = DeliveryUnit.find(params[:id])
  end

  # POST /delivery_units
  # POST /delivery_units.xml
  def create
    @delivery_unit = @delivery.delivery_units.new(params[:delivery_unit])

    respond_to do |format|
      if @delivery_unit.save
path =       pickup_delivery_delivery_unit_path(@pickup,@delivery,@delivery_unit)
        format.html { 
        redirect_to( path,:notice => 'Delivery unit was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /delivery_units/1
  # PUT /delivery_units/1.xml
  def update
    @delivery_unit = DeliveryUnit.find(params[:id])
path =       pickup_delivery_delivery_unit_path(@pickup,@delivery,@delivery_unit)
    respond_to do |format|
      if @delivery_unit.update_attributes(params[:delivery_unit])
        format.html {redirect_to(  path, :notice => 'Delivery unit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivery_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_units/1
  # DELETE /delivery_units/1.xml
  def destroy
    @delivery_unit = DeliveryUnit.find(params[:id])
    @delivery_unit.destroy
    path =       pickup_delivery_deliveries_unit_path(@pickup,@delivery)
redirect_to path
  end
end
