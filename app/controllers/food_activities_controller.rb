# frozen_string_literal: true

class FoodActivitiesController < ApplicationController
  before_action :set_food_activity, only: %i[show edit update destroy]

  # GET /food_activities
  # GET /food_activities.json
  def index
    if params[:child]
      @food_activities = FoodActivity.where(childern_id:params[:child], created_at:"#{params[:day]} 00:00:00").page params[:page]
    else
      @food_activities = FoodActivity.page params[:page]
    end
  end

  # GET /food_activities/1
  # GET /food_activities/1.json
  def show; end

  # GET /food_activities/new
  def new
    @food_activity = FoodActivity.new
  end

  # GET /food_activities/1/edit
  def edit; end

  # POST /food_activities
  # POST /food_activities.json
  def create
    @food_activity = FoodActivity.new(food_activity_params)

    respond_to do |format|
      if @food_activity.save
        format.html { redirect_to @food_activity, notice: 'Food activity was successfully created.' }
        format.json { render :show, status: :created, location: @food_activity }
      else
        format.html { render :new }
        format.json { render json: @food_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_activities/1
  # PATCH/PUT /food_activities/1.json
  def update
    respond_to do |format|
      if @food_activity.update(food_activity_params)
        format.html { redirect_to @food_activity, notice: 'Food activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_activity }
      else
        format.html { render :edit }
        format.json { render json: @food_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_activities/1
  # DELETE /food_activities/1.json
  def destroy
    @food_activity.destroy
    respond_to do |format|
      format.html { redirect_to food_activities_url, notice: 'Food activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food_activity
    @food_activity = FoodActivity.find(params[:id])
  end

  def food_activity_params
    params.require(:food_activity).permit(:childern_id, :food_id, :food_type,
                                          :percentage)
  end
end
