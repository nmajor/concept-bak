class TemplatesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
    @template.name = Name.create( :text => "Concept Template" )
    @template.desc = Desc.create( :text => "<8 Word Clear, Catchy, Description of Product" )
    @template.body = Body.create( :text => "Describe the product, focusing on the benefits and ultimate outcomes that the product provides. Selling an ab workout? Sell the 6 pack. Self-help seminar? Sell the success story they will become. You have 1-2 short paragraphs and around ~125 words (~6 lines) before you lose attention. Minimize the setup, you don’t setup, and use declarative words that don’t need qualifiers or superlatives. Don’t repeat yourself, and try doing a few different concepts, with original perspectives and evidence." )
    rtbgroup = Rtbgroup.create( :name => "Here's How" )
    rtb1 = Rtb.create( :text => 'Reason #1. Feature, data, or proof + benefit as a result' )
    rtb2 = Rtb.create( :text => 'Reason #2. Feature, data, or proof + benefit as a result' )
    rtb3 = Rtb.create( :text => 'Reason #3. Feature, data, or proof + benefit as a result' )
    rtbgroup.rtbs << rtb1
    rtbgroup.rtbs << rtb2
    rtbgroup.rtbs << rtb3
    @template.rtbgroups << rtbgroup
    @template.user = current_user
    @template.save
    redirect_to edit_template_path(@template)
  end

  # GET /templates/1/edit
  def edit
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    saved = true

    saved = false unless @template.update(template_params)
    if params[:rtbgroups]
      params[:rtbgroups].collect{|k,v| v }.each do |g|
        group = Rtbgroup.find_by_id g["id"]
        group = Rtbgroup.new if group.nil?
        group.name = g["name"]
        group.template = @template
        saved = false unless group.save
        g["rtbs"].collect{|k,v| v }.each do |r|
          rtb = Rtb.find_by_id r["id"] 
          rtb = Rtb.new if rtb.nil?
          rtb.text = r["text"]
          rtb.rtbgroup = group
          saved = false unless rtb.save
        end
      end
    end

    respond_to do |format|
      if saved
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @template }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit( :image, :name_attributes => [:text], :desc_attributes => [:text], :body_attributes => [:text] )
    end
end
