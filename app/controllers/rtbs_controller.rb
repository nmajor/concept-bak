class RtbsController < ApplicationController
  def destroy
    @rtb = Rtb.find_by_id params[:id]
    @rtb.update_attribute(:active, false)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

end