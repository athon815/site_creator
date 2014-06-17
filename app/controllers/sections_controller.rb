class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @pages = Page.find(params[:id])
    @page.sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @page = Page.find(params[:id])
    @page.sections = Section.find(params[:id])
  end

  # GET /sections/new
  def new
    @page = Page.find(params[:id])
    @page.sections = Section.new(:page_id => params[:page_id])
  end

  # GET /sections/1/edit
  def edit

  end

  # POST /sections
  # POST /sections.json
  def create
    @page = Page.find(params[:page_id])
    @section = @page.sections.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @page, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @page.sections.update(section_params)
        format.html { redirect_to @page.sections, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @page.sections.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @page.sections.destroy
    @page.sections.image = nil
    @page.sections.image
    respond_to do |format|
      format.html { redirect_to page_sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = @page.sections.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:title, :body, :page_id, :image)
    end
end
