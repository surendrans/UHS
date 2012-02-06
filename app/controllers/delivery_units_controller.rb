class DeliveryUnitsController < ApplicationController
  # GET /delivery_units
  # GET /delivery_units.xml
  def index
    @delivery_units = DeliveryUnit.all

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
    @delivery_unit = DeliveryUnit.new(params[:delivery_unit])

    respond_to do |format|
      if @delivery_unit.save
        format.html { redirect_to(@delivery_unit, :notice => 'Delivery unit was successfully created.') }
        format.xml  { render :xml => @delivery_unit, :status => :created, :location => @delivery_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivery_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_units/1
  # PUT /delivery_units/1.xml
  def update
    @delivery_unit = DeliveryUnit.find(params[:id])

    respond_to do |format|
      if @delivery_unit.update_attributes(params[:delivery_unit])
        format.html { redirect_to(@delivery_unit, :notice => 'Delivery unit was successfully updated.') }
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

    respond_to do |format|
      format.html { redirect_to(delivery_units_url) }
      format.xml  { head :ok }
    end
  end
end
