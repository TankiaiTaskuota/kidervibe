# frozen_string_literal: true

class AppDaysController < ApplicationController
  before_action :set_app_day, only: %i[show edit update destroy]

  # GET /app_days
  # GET /app_days.json
  def index
    @app_days = AppDay.order(created_at: 'desc').page params[:page]
  end

  # GET /app_days/1
  # GET /app_days/1.json
  def show
    @images = Image.where(childern_id: @app_day.childern_id,
                          created_at: @app_day.created_at).all
  end

  # GET /app_days/new
  def new
    @app_day = AppDay.new
  end

  # GET /app_days/1/edit
  def edit; end

  # POST /app_days
  # POST /app_days.json
  def create
    @app_day = AppDay.new(app_day_params)

    respond_to do |format|
      if @app_day.save
        format.html { redirect_to @app_day, notice: 'App day was successfully created.' }
        format.json { render :show, status: :created, location: @app_day }
      else
        format.html { render :new }
        format.json { render json: @app_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_days/1
  # PATCH/PUT /app_days/1.json
  def update
    respond_to do |format|
      if @app_day.update(app_day_params)
        format.html { redirect_to @app_day, notice: 'App day was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_day }
      else
        format.html { render :edit }
        format.json { render json: @app_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_days/1
  # DELETE /app_days/1.json
  def destroy
    @app_day.destroy
    respond_to do |format|
      format.html { redirect_to app_days_url, notice: 'App day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_app_day
    @app_day = AppDay.find(params[:id])
  end

  def app_day_params
    params.require(:app_day).permit(:childern_id, :comment, :thema, :outdoors,
                                    :sleep, :food)
  end
end
