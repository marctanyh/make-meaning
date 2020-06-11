class OppourtunitiesController < ApplicationController
  before_action :set_oppourtunity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!, only: [:new, :create, :destroy]
  before_action :set_sidebar, except: [:show]
  # GET /oppourtunities
  # GET /oppourtunities.json
  def index
    @oppourtunities = Oppourtunity.all
  end

  # GET /oppourtunities/1
  # GET /oppourtunities/1.json
  def show
    @user = @oppourtunity.account
  end

  # GET /oppourtunities/new
  def new
    @oppourtunity = Oppourtunity.new
  end

  # GET /oppourtunities/1/edit
  def edit
  end

  # POST /oppourtunities
  # POST /oppourtunities.json
  def create
    @oppourtunity = Oppourtunity.new(oppourtunity_params)
    @oppourtunity.account_id = current_account.id

    respond_to do |format|
      if @oppourtunity.save
        format.html { redirect_to @oppourtunity, notice: 'Oppourtunity was successfully created.' }
        format.json { render :show, status: :created, location: @oppourtunity }
      else
        format.html { render :new }
        format.json { render json: @oppourtunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oppourtunities/1
  # PATCH/PUT /oppourtunities/1.json
  def update
    respond_to do |format|
      if @oppourtunity.update(oppourtunity_params)
        format.html { redirect_to @oppourtunity, notice: 'Oppourtunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @oppourtunity }
      else
        format.html { render :edit }
        format.json { render json: @oppourtunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oppourtunities/1
  # DELETE /oppourtunities/1.json
  def destroy
    @oppourtunity.destroy
    respond_to do |format|
      format.html { redirect_to oppourtunities_url, notice: 'Oppourtunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oppourtunity
      @oppourtunity = Oppourtunity.find(params[:id])
    end

    def set_sidebar
      @show_sidebar = true 
    end

    # Only allow a list of trusted parameters through.
    def oppourtunity_params
      params.require(:oppourtunity).permit(:name, :body, :photo, :photo_cache)
    end
end
