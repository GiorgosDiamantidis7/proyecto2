class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      flash[:notice] = "List created"
      redirect_to lists_path(@list)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path(@list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

  private
  def list_params
    params.require(:list).permit(:name, :date, :total, :user_id)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
