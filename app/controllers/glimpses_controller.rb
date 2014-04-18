class GlimpsesController < ApplicationController
  def show
    @glimpse = Glimpse.find params[:id]
    @template = @glimpse.template

    @template.body.highlight @glimpse.body_highlights

  end
end
