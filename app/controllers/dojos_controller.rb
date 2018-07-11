class DojosController < ApplicationController
  def index
  end

  def new
  end

  def create
    @dojo = Dojo.new(dojo_params)
    #Flash Vlidations
    if @dojo.valid?
      @dojo.save
      redirect_to "/"
    else
      flash[:error] = @dojo.errors.full_messages
      redirect_to "/dojos/new"
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
    redirect_to "/dojos/#{params[:id]}/students" # redirects to the students page and basically merges the 2 html's together
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(dojo_params)
    redirect_to "/"
  end

  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.destroy
    redirect_to "/"
  end

  def process_dojo_form
  end

  def set_dojo
  end

  private # dojo private dictionary!
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end

end
