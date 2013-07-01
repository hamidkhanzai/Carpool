class RoutsController < ApplicationController
  # GET /routs
  # GET /routs.json
 
 before_filter :authenticate_user!
  #@routs = Rout.page(params[:page]).per(5)
  
  #render  'index'
  
  
    def index
     
     
    if current_user.Admin?
    @routs = Rout.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    else
      @routs=Rout.paginate(:page => params[:page], :per_page => 5).where("userid=?",current_user.id).order("created_at DESC")
    end

  end

 
  # GET /routs/1
  # GET /routs/1.json
  def show
   # @rout = Rout.find(params[:id])
    @rout = Rout.find(params[:id],:include => :user, :joins => "INNER JOIN users ON routs.userId = users.id")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rout }
    end
  end

  # GET /routs/new
  # GET /routs/new.json
  
  def new
    @cars =Car.where("user_id=?",current_user.id)
    @rout = Rout.new
   
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rout }
    
    
     end
    end


  # GET /routs/1/edit
  def edit
    @cars =Car.where("user_id=?",current_user.id)
    @rout = Rout.find(params[:id])
    @t_date=@rout.travel_date
  end

  # POST /routs
  # POST /routs.json
  def create


    @rout = Rout.new(params[:rout])
    @rout.travel_date=params[:travel_date].to_date

    respond_to do |format|
      if @rout.save
        format.html { redirect_to @rout, notice: 'Rout was successfully created.' }
      format.json { render json: @rout, status: :created, location: @rout }
      else
        @cars =Car.where("user_id=?",current_user.id)
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
