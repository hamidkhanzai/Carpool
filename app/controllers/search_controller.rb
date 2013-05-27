class SearchController < ApplicationController

  def index
  @routs = Rout.all
  
  end
  def list
    travel_date="#{params[:travel_date]["(1i)"]}-#{params[:travel_date]["(2i)"]}-#{params[:travel_date]["(3i)"]}"




    @routs = Rout.where("d_to= ? and d_from= ? and travel_date= ?",params[:d_to],params[:d_from],travel_date)



  end
end
