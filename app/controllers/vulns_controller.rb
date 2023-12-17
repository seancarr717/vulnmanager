class VulnsController < ApplicationController
  before_action :set_vuln, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index, :show]
  #only allows certain functions when correct user
  before_action :correct_user,only:[:edit, :update, :destroy]

  # GET /vulns or /vulns.json
  def index
    @vulns = Vuln.all
  end

  # GET /vulns/1 or /vulns/1.json
  def show
  end

  # GET /vulns/new
  def new
    #@vuln = Vuln.new
    @vuln = current_user.vulns.build
  end

  # GET /vulns/1/edit
  def edit
  end

  # POST /vulns or /vulns.json
  def create
    #@vuln = Vuln.new(vuln_params)
    @vuln = current_user.vulns.build(vuln_params)
    respond_to do |format|
      if @vuln.save
        format.html { redirect_to vuln_url(@vuln), notice: "Vuln was successfully created." }
        format.json { render :show, status: :created, location: @vuln }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vuln.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vulns/1 or /vulns/1.json
  def update
    respond_to do |format|
      if @vuln.update(vuln_params)
        format.html { redirect_to vuln_url(@vuln), notice: "Vuln was successfully updated." }
        format.json { render :show, status: :ok, location: @vuln }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vuln.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vulns/1 or /vulns/1.json
  def destroy
    @vuln.destroy

    respond_to do |format|
      format.html { redirect_to vulns_url, notice: "Vuln was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # searches up if correct user by comparing current user to devise primary key user
  def correct_user
    @vuln = current_user.vulns.find_by(id: params[:id])
    redirect_to vulns_path,notice: "Please Authorise to Edit Vulnerability Details" if @vuln.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vuln
      @vuln = Vuln.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vuln_params
      params.require(:vuln).permit(:vuln_name, :vuln_type, :cve, :discovered, :user_id)
    end
end
