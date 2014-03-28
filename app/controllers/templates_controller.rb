class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

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
    @template.save
    redirect_to edit_template_path(@template)
  end

  # GET /templates/1/edit
  def edit
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
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
