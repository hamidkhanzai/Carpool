class RoutsController < ApplicationController
  # GET /routs
  # GET /routs.json
 
 before_filter :authenticate_user!, :except=>[:show,:index] 
  #@routs = Rout.page(params[:page]).per(5)
  #rander 'search'
 
  def search
    
  end
  #render  'index'
  def index
    @routs = Rout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routs }
    end
  end
 
  # GET /routs/1
  # GET /routs/1.json
  def show
    @rout = Rout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rout }
    end
  end

  # GET /routs/new
  # GET /routs/new.json
  
  def new
   
    @rout = Rout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rout }
    
    
     end
    end


  # GET /routs/1/edit
  def edit
    @rout = Rout.find(params[:id])
  end

  # POST /routs
  # POST /routs.json
  def create
    @rout = Rout.new(params[:rout])

    respond_to do |format|
      if @rout.save
        format.html { redirect_to @rout, notice: 'Rout was successfully created.' }
        format.json { render json: @rout, status: :created, location: @rout }
      else
        format.html { render action: "new" }
        format.json { render json: @rout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routs/1
  # PUT /routs/1.json
  def update
    @rout = Rout.find(params[:id])

    respond_to do |format|
      if @rout.update_attributes(params[:rout])
        format.html { redirect_to @rout, notice: 'Rout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routs/1
  # DELETE /routs/1.json
  def destroy
    @rout = Rout.find(params[:id])
    @rout.destroy

    respond_to do |format|
      format.html { redirect_to routs_url }
      format.json { head :no_content }
    end
  end
end
