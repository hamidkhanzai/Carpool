class SearchController < ApplicationController

  def index
    
   @routs = Rout.search(params[:d_from],[:d_to],[:tarvel_date])
  
  
  end
  def list
    travel_date="#{params[:travel_date]["(1i)"]}-#{params[:travel_date]["(2i)"]}-#{params[:travel_date]["(3i)"]}"

    @routs = Rout.where("d_to= ? and d_from= ? and travel_date= ?",params[:d_to],params[:d_from],travel_date).paginate(:page => params[:page], :per_page => 5)

  end
end
