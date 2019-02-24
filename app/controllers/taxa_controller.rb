class TaxaController < ApplicationController
  before_action :set_taxon, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy

  # GET /taxa
  # GET /taxa.json
  def index
    @taxa = Taxon.all.paginate(page: params[:page])
  end

  # GET /taxa/1
  # GET /taxa/1.json
  def show
  end

  # GET /taxa/new
  def new
    @taxon = Taxon.new
  end

  # GET /taxa/1/edit
  def edit
  end

  # POST /taxa
  # POST /taxa.json
  def create
    @taxon = Taxon.new(taxon_params)

    respond_to do |format|
      if @taxon.save
        format.html { redirect_to @taxon, notice: 'Taxon was successfully created.' }
        format.json { render :show, status: :created, location: @taxon }
      else
        format.html { render :new }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxa/1
  # PATCH/PUT /taxa/1.json
  def update
    respond_to do |format|
      if @taxon.update(taxon_params)
        format.html { redirect_to @taxon, notice: 'Taxon was successfully updated.' }
        format.json { render :show, status: :ok, location: @taxon }
      else
        format.html { render :edit }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxa/1
  # DELETE /taxa/1.json
  def destroy
    @taxon.destroy
    respond_to do |format|
      format.html { redirect_to taxa_url, notice: 'Taxon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxon
      @taxon = Taxon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taxon_params
      params.require(:taxon).permit(:taxon_name, :taxon_guid, :dataset_id)
    end
end
