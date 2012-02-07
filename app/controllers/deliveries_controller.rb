class DeliveriesController < ApplicationController
  before_filter :get_pickup
  
  def get_pickup
  @pickup = Pickup.find(params[:pickup_id])
  end
  
  def index
    @deliveries = @pickup.deliveries
  end

  def show
    @delivery = Delivery.find(params[:id])
  end

  def new
    @delivery = Delivery.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = @pickup.deliveries.new(params[:delivery])

      if @delivery.save
 redirect_to(pickup_deliveries_path(@pickup), :notice => 'Delivery was successfully created.') 
      else
render :action => "new" 
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
      if @delivery.update_attributes(params[:delivery])
redirect_to(pickup_deliveries_path(@pickup), :notice => 'Delivery was successfully updated.') 
      else
render :action => "edit" 
    end
  end

def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
	 redirect_to(pickup_deliveries_path(@pickup))
  end  
end
