class ProposalsController < ApplicationController
  before_action :set_cooperative, :set_assembly
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = Proposal.all
  end

  def show
  end

  def new
    @proposal = Proposal.new
  end

  def edit
  end

  def create
    @proposal = Proposal.new(proposal_params)

    render :new unless @proposal.save
  end

  def update
    render :new unless @proposal.update(proposal_params)
  end

  def destroy
    @proposal.destroy
  end

  private

  def set_proposal
    @proposal = @assembly.proposals.find(params[:id])
  end

  def set_cooperative
    @cooperative = Cooperative.find(params[:cooperative_id])
  end

  def set_assembly
    @assembly = @cooperative.assemblies.find(params[:assembly_id])
  end

  def proposal_params
    params.require(:proposal).permit(
      :owner_name,
      :optionl_1_name,
      :optionl_1_percent,
      :optionl_2_name,
      :optionl_2_percent
    ).merge(assembly: @assembly, owner_name: current_associate.name)
  end
end
