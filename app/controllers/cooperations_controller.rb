class CooperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cooperative

  def new
    redirext_if_cooperation_exists
  end

  def show
    @cooperation = @cooperative.cooperations.find(params[:id])
  end

  def create
    @cooperation = Cooperation.new(cooperation_params)

    if @cooperation.save
      redirect_to @cooperative, notice: 'Cadastrado com sucesso'
    else
      render :new
    end
  end

  private

  def cooperation_params
    { cooperative: @cooperative,
      associate: current_associate,
      share_capital: @cooperative.value_minimum_to_start }
  end

  def set_cooperative
    @cooperative = Cooperative.find(params[:cooperative_id])
  end

  def redirext_if_cooperation_exists
    if @cooperative.cooperations.find_by(associate: current_associate)
      redirect_to @cooperative, notice: 'Você já é participante!'
    end
  end
end
