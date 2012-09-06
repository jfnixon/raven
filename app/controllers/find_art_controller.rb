class FindArtController < ApplicationController
  def find
    @limited_edition = LimitedEdition.new
  end
end
