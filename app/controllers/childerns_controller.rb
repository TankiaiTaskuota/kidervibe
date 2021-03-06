# frozen_string_literal: true

class ChildernsController < ApplicationController
  before_action :set_childern, only: %i[show edit update destroy]

  # GET /childerns
  # GET /childerns.json
  def index
    @childerns = Childern.page params[:page]
  end

  # GET /childerns/1
  # GET /childerns/1.json
  def show
    @childern.get_by_day_info
  end

  # GET /childerns/new
  def new
    @childern = Childern.new
  end

  # GET /childerns/1/edit
  def edit; end

  # POST /childerns
  # POST /childerns.json
  def create
    @childern = Childern.new(childern_params)

    respond_to do |format|
      if @childern.save
        format.html { redirect_to @childern, notice: 'Childern was successfully created.' }
        format.json { render :show, status: :created, location: @childern }
      else
        format.html { render :new }
        format.json { render json: @childern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /childerns/1
  # PATCH/PUT /childerns/1.json
  def update
    respond_to do |format|
      if @childern.update(childern_params)
        format.html { redirect_to @childern, notice: 'Childern was successfully updated.' }
        format.json { render :show, status: :ok, location: @childern }
      else
        format.html { render :edit }
        format.json { render json: @childern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /childerns/1
  # DELETE /childerns/1.json
  def destroy
    @childern.destroy
    respond_to do |format|
      format.html { redirect_to childerns_url, notice: 'Childern was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_childern
    @childern = Childern.find(params[:id])
  end

  def childern_params
    params.require(:childern).permit(:name, :app_id)
  end
end
