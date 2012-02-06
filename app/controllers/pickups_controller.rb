class PickupsController < ApplicationController
  # GET /pickups
  # GET /pickups.xml
  def index
    @pickups = Pickup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pickups }
    end
  end

  # GET /pickups/1
  # GET /pickups/1.xml
  def show
    @pickup = Pickup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pickup }
    end
  end

  # GET /pickups/new
  # GET /pickups/new.xml
  def new
    @pickup = Pickup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pickup }
    end
  end

  # GET /pickups/1/edit
  def edit
    @pickup = Pickup.find(params[:id])
  end

  # POST /pickups
  # POST /pickups.xml
  def create
    @pickup = Pickup.new(params[:pickup])

    respond_to do |format|
      if @pickup.save
        format.html { redirect_to(@pickup, :notice => 'Pickup was successfully created.') }
        format.xml  { render :xml => @pickup, :status => :created, :location => @pickup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pickup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pickups/1
  # PUT /pickups/1.xml
  def update
    @pickup = Pickup.find(params[:id])

    respond_to do |format|
      if @pickup.update_attributes(params[:pickup])
        format.html { redirect_to(@pickup, :notice => 'Pickup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pickup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1
  # DELETE /pickups/1.xml
  def destroy
    @pickup = Pickup.find(params[:id])
    @pickup.destroy

    respond_to do |format|
      format.html { redirect_to(pickups_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_deliveries
#	@pickup = Pickup.find_by_code(params[:code]).include(:deliveries)
@pickups = Pickup.find_all_by_code(params[:code], :include =>{:deliveries => :delivery_units})
	p = @pickups.collect do |pi|
		{ 
			:name => pi.name, 
			:deliveries => pick_up_deliveries(pi.deliveries)
		}
	end
	render :json => p
  end
  
  def pick_up_deliveries(d)
  		d.map do |de|
		{:transfer_no => de.transfer_no,
    	:ordered_by => de.ordered_by,
      :delivery_note => de.delivery_note,
      :po_no => de.po_no,
      :deliver_date => de.deliver_date,
      :phone_no => de.phone_no,
      :address => de.address,
      :delivery_units => de.delivery_units }
  		end
  end
  
end
