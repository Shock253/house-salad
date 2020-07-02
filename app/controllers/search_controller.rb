class SearchController < ApplicationController
  def index
    @members = SearchResults.new.members(params[:state])
  end
end
