class HighlightsController < ApplicationController

  def show
  end

  def create
    @highlight = Highlight.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.json { render action: 'show', status: :created, location: @highlight }
      else
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def highlight_params
      params.require(:highlight).permit( :highlightable_id, :highlightable_type, :highlightable_attr, :start, :end, :length, :text )
    end
end
