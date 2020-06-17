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
    @user_oppourtunities = Oppourtunity.where(account_id: @user.id).where.not(id: @oppourtunity.id)
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

  def email_user
    # trigger email send
    user_id = params[:user_id]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    logger.debug "User: #{:user_id}"
    logger.debug "First name: #{:first_name}"
    logger.debug "Last name: #{:last_name}"
    logger.debug "Email: #{:email}"
    logger.debug "Message: #{:message}"

    ContactMailer.email_user( user_id, first_name, last_name,  email, message ).deliver_now

    # response to script 
    respond_to do |format|
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
      params.require(:oppourtunity).permit(:name, :body, :photo, :photo_cache, :introduction, :conclusion, :open, :application_date)
    end
end
