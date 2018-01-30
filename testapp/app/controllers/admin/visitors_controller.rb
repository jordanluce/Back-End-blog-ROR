class Admin::VisitorsController < Admin::ApplicationController
  def index
  	@visitors = Visitor.all.order(id: :desc).page params[:page]
  end

  def destroy
  	@visitors = Visitor.find(params[:id])
  	@visitors.destroy
  	redirect_to :back, notice:'Successfully deleted'
  end
end
