class DatasetsController < ApplicationController
  before_action :set_dataset, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy

  # GET /datasets
  # GET /datasets.json
  def index
    @datasets = Dataset.all.paginate(page: params[:page])
  end

  # GET /datasets/1
  # GET /datasets/1.json
  def show
  end

  # GET /datasets/new
  def new
    @dataset = Dataset.new
  end

  # GET /datasets/1/edit
  def edit
  end

  # POST /datasets
  # POST /datasets.json
  def create
    @dataset = Dataset.new(dataset_params)

    respond_to do |format|
      if @dataset.save
        format.html { redirect_to @dataset, notice: 'Dataset was successfully created.' }
        format.json { render :show, status: :created, location: @dataset }
      else
        format.html { render :new }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasets/1
  # PATCH/PUT /datasets/1.json
  def update
    respond_to do |format|
      if @dataset.update(dataset_params)
        format.html { redirect_to @dataset, notice: 'Dataset was successfully updated.' }
        format.json { render :show, status: :ok, location: @dataset }
      else
        format.html { render :edit }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.json
  def destroy
    @dataset.destroy
    respond_to do |format|
      format.html { redirect_to datasets_url, notice: 'Dataset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_params
      params.require(:dataset).permit(:dataset_name, :doi_dataset, :doi_reference, :description, :license, :taxonomic_group, :user_id, taxa_attributes: [:id, :taxon_name, :taxon_guid, :_destroy], traits_attributes: [:id, :trait_name, :trait_guid, :description, :_destroy])
    end
end
