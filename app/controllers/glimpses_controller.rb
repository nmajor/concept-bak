class GlimpsesController < ApplicationController
  def show
    @glimpse = Glimpse.find params[:id]
    @template = @glimpse.template

    @template.body.highlight @glimpse.body_highlights
    @template.name.highlight @glimpse.name_highlights
    @template.desc.highlight @glimpse.desc_highlights

    @template.rtbgroups.each do |rtbg|
      rtbg.highlight @glimpse.rtbgroup_highlights(rtbg.id)
      rtbg.active_rtbs.each do |rtb|
        rtb.highlight @glimpse.rtb_highlights (rtb.id)
      end
    end

  end
end
