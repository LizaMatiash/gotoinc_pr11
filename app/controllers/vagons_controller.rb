class VagonsController < ApplicationController
  before_action :set_train, only: %i[new create]

  def index
    @vagons = Vagon.all
  end

  def show
    @vagon = Vagon.find(params[:id])
  end

  def new
    @vagon = Vagon.new
  end

  def edit; end

  def create
    # @train = Train.find(params[:train_id])
    @vagon = @train.vagons.new(vagon_params)

    respond_to do |format|
      if @vagon.save
        format.html { redirect_to @train, notice: 'Vagon was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vagon.update(vagon_params)
        format.html { redirect_to vagon_url(@vagon), notice: 'Vagon was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vagon.destroy

    respond_to do |format|
      format.html { redirect_to vagons_url, notice: 'Vagon was successfully destroyed.' }
    end
  end

  private

  def set_vagon
    @vagon = Vagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def vagon_params
    params.require(:vagon).permit(:vagon_id, :type, :places_up, :places_down, :sitting_places,
      :side_places_up, :side_places_down, :order_v)
  end
end
