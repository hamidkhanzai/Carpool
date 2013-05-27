class SearchController < ApplicationController

  def index

  end
  def list
    @routs = Rout.where("price=?", '33')

  end
end
