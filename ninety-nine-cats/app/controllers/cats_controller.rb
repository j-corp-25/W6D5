class CatsController < ApplicationController
  def index
    @cats = Cat.all.order(:id)
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])

    if @cat
      render :show
    else
      redirect_to cat_url(@cat)
    end

  end
  def new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
        redirect_to cat_url(@cat)
    else
        render json: @cat.errors.full_messages, status: 422
    end
end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end


  private
  def cat_params
    params.require(:cats).permit(:name,:color,:datebirth,:description,:sex)
  end
end
