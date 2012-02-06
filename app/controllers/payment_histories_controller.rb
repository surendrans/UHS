class PaymentHistoriesController < ApplicationController
  # GET /payment_histories
  # GET /payment_histories.xml
  def index
    @payment_histories = PaymentHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_histories }
    end
  end

  # GET /payment_histories/1
  # GET /payment_histories/1.xml
  def show
    @payment_history = PaymentHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_history }
    end
  end

  # GET /payment_histories/new
  # GET /payment_histories/new.xml
  def new
    @payment_history = PaymentHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_history }
    end
  end

  # GET /payment_histories/1/edit
  def edit
    @payment_history = PaymentHistory.find(params[:id])
  end

  # POST /payment_histories
  # POST /payment_histories.xml
  def create
    @payment_history = PaymentHistory.new(params[:payment_history])

    respond_to do |format|
      if @payment_history.save
        format.html { redirect_to(@payment_history, :notice => 'Payment history was successfully created.') }
        format.xml  { render :xml => @payment_history, :status => :created, :location => @payment_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_histories/1
  # PUT /payment_histories/1.xml
  def update
    @payment_history = PaymentHistory.find(params[:id])

    respond_to do |format|
      if @payment_history.update_attributes(params[:payment_history])
        format.html { redirect_to(@payment_history, :notice => 'Payment history was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_histories/1
  # DELETE /payment_histories/1.xml
  def destroy
    @payment_history = PaymentHistory.find(params[:id])
    @payment_history.destroy

    respond_to do |format|
      format.html { redirect_to(payment_histories_url) }
      format.xml  { head :ok }
    end
  end
end
