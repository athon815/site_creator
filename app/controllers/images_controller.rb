class ImagesController < ApplicationController
	# before_action :set_image, only: [:create]

	def new
		@section = @page.sections.first
		@image = Image.new
	end

	
	def edit
    @page = Page.find(params[:id]).update_attributes(:bgcolor => params[:bgcolor])
    @section = @page.sections.first
  end


	def index
		@images = Image.all
	end

	def create
    @page = Page.find(params[:page_id])
    @section = @page.sections.first
    @image = Image.new(image_params)
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to @page, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


	private

	def set_image
		@image = Image.find(params[:id])
	end

	def image_params
    params.require(:image).permit(:file)
  end

  def set_section
    @section = @page.sections
  end
end