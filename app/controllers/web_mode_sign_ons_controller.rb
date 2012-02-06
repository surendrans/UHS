class WebModeSignOnsController < ApplicationController
  # GET /web_mode_sign_ons
  # GET /web_mode_sign_ons.xml
  def index
    @web_mode_sign_ons = WebModeSignOn.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @web_mode_sign_ons }
    end
  end

  # GET /web_mode_sign_ons/1
  # GET /web_mode_sign_ons/1.xml
  def show
    @web_mode_sign_on = WebModeSignOn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @web_mode_sign_on }
    end
  end

  # GET /web_mode_sign_ons/new
  # GET /web_mode_sign_ons/new.xml
  def new
    @web_mode_sign_on = WebModeSignOn.new

  end

  # GET /web_mode_sign_ons/1/edit
  def edit
    @web_mode_sign_on = WebModeSignOn.find(params[:id])
  end

  # POST /web_mode_sign_ons
  # POST /web_mode_sign_ons.xml
  def create
    @web_mode_sign_on = WebModeSignOn.new(params[:web_mode_sign_on])

    respond_to do |format|
      if @web_mode_sign_on.save
        format.html { redirect_to(@web_mode_sign_on, :notice => 'Signed Up successfully.') }
        format.xml  { render :xml => @web_mode_sign_on, :status => :created, :location => @web_mode_sign_on }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @web_mode_sign_on.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /web_mode_sign_ons/1
  # PUT /web_mode_sign_ons/1.xml
  def update
    @web_mode_sign_on = WebModeSignOn.find(params[:id])

    respond_to do |format|
      if @web_mode_sign_on.update_attributes(params[:web_mode_sign_on])
        format.html { redirect_to(@web_mode_sign_on, :notice => 'Web mode sign on was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @web_mode_sign_on.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /web_mode_sign_ons/1
  # DELETE /web_mode_sign_ons/1.xml
  def destroy
    @web_mode_sign_on = WebModeSignOn.find(params[:id])
    @web_mode_sign_on.destroy

    respond_to do |format|
      format.html { redirect_to(web_mode_sign_ons_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_token 
    user_name = params[:name]
    user_password = params[:password]
    @user = WebModeSignOn.find_by_name(user_name)
    respond_to do |format|
      format.json {render :json => { :token => @user.token }}
    end
  end
end
