class AssembliesController < ApplicationController
  before_action :set_cooperative
  before_action :set_assembly, only: [:show, :edit, :update, :destroy]

  def index
    @assemblies = @cooperative.assemblies
  end

  def show
  end

  def new
    @assembly = Assembly.new
    @assembly.proposals.build
  end

  def edit
  end

  def create
    @assembly = Assembly.new(assembly_params)
    @assembly.proposals.first.owner_name = 'Conselho de Administração'

    respond_to do |format|
      if @assembly.save
        format.html { redirect_to [@cooperative, @assembly], notice: 'Assempleia criada com sucesso.' }
        format.json { render :show, status: :created, location: @assembly }
      else
        format.html { render :new }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @assembly.update(assembly_params)
        format.html { redirect_to [@cooperative, @assembly], notice: 'Assempleia atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @assembly }
      else
        format.html { render :edit }
        format.json { render json: @assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assembly.destroy
    respond_to do |format|
      format.html { redirect_to cooperative_assemblies_url(@cooperative), notice: 'Assempleia excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cooperative
    @cooperative = Cooperative.find(params[:cooperative_id])
  end

  def set_assembly
    @assembly = @cooperative.assemblies.find(params[:id])
  end

  def assembly_params
    params.require(:assembly).permit(
      :value_to_split,
      :pre_assembly_date,
      :voting_date,
      :proposals_attributes => [
        :optionl_1_name,
        :optionl_1_percent,
        :optionl_2_name,
        :optionl_2_percent
      ]
    ).merge(cooperative: @cooperative)
  end
end
