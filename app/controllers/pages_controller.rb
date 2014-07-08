class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_section, only: :edit

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @section = @page.sections.first
    @image = @section.images
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
    @section = @page.sections.first
    @image = Image.new
  end

  def create
    @page = Page.new(page_params)
    @section = @page.sections.new
    respond_to do |format|
      if @page.save 
        format.html { redirect_to edit_page_path(@page) }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])
    @section = @page.sections.first
    @page.update_attributes(:bgcolor => params[:bgcolor])
    @image = @section.images.save

    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    @page.image   
    respond_to do |format|
      format.html { redirect_to welcome_index_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def set_section
    @section = @page.sections.new
  end
  
  def set_image
    @image = Image.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :image) if params[:page]
  end

  def sections_params
    params.require(:section).permit(:title, :body, :page_id, :image)
  end

  def image_params
    params.require(:image).permit(:file, :section_id)
  end
end
