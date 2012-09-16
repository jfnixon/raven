class FindArtController < ApplicationController
  def yfind
    yubi_key = params[:yubi_opt][0..11]
    @limited_edition = LimitedEdition.yubi_find yubi_key
    render :template => "limited_editions/show"
  end
end
