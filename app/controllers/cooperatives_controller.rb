class CooperativesController < ApplicationController
  before_action :set_cooperative, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @cooperatives = Cooperative.joins(:cooperations)
      .where('cooperations.associate_id = ?', current_associate.id)
  end

  def show
    render layout: "cooperative"
  end

  def new
    @cooperative = Cooperative.new
  end

  def edit
  end

  def create
    @cooperative = Cooperative.new(cooperative_params)

    respond_to do |format|
      if @cooperative.save
        format.html { redirect_to @cooperative, notice: 'Cooperativa criada com sucesso.' }
        format.json { render :show, status: :created, location: @cooperative }
      else
        format.html { render :new }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cooperative.update(cooperative_params)
        format.html { redirect_to @cooperative, notice: 'Cooperativa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @cooperative }
      else
        format.html { render :edit }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cooperative.destroy
    respond_to do |format|
      format.html { redirect_to cooperatives_url, notice: 'Cooperativa removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cooperative
      @cooperative = Cooperative.find(params[:id])
    end

    def cooperative_params
      params.require(:cooperative).permit(
        :name,
        :description,
        :short_description,
        :segment_id,
        :minimum_of_associates,
        :value_minimum_to_start,
        :indicators,
        :development_time_in_days,
        :cost_per_transaction,
        :share_capital,
        :video_url
      ).merge(founder: current_associate)
    end
end
