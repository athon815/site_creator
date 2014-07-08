class WelcomeController < ApplicationController
  def index
  	@pages = Page.all.order(:title)
  end

	private

  def set_page
    @page = Page.find(params[:id])
  end


	def page_params
		params.require(:page).permit(:title, :image) if params[:page]
	end
end
