class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]

  def index
    @gears = Gear.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @gear = Gear.new
    authorize @gear
  end

  def create
    authorize @gear
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to @gear, notice: 'Gear was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @gear
  end

  def update
    authorize @gear
    if @gear.update(gear_params)
      redirect_to @gear, notice: 'Gear was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @gear
    @gear.destroy!

    respond_to do |format|
      format.html { redirect_to genres_path, status: :see_other, notice: "Gear was successfully destroyed." }
      format.json { head :no_content }
  end
end

  private

    def set_gear
      @gear = Gear.find(params[:id])
    end

    def gear_params
      params.require(:gear).permit(:item, :description, :price)
    end
end
