class FollowerCountsController < ApplicationController
  before_action :set_follower_count, only: [:show, :edit, :update, :destroy]

  # GET /follower_counts
  # GET /follower_counts.json
  def index
    @follower_counts = FollowerCount.all
  end

  # GET /follower_counts/1
  # GET /follower_counts/1.json
  def show
  end

  # GET /follower_counts/new
  def new
    @follower_count = FollowerCount.new
  end

  # GET /follower_counts/1/edit
  def edit
  end

  # POST /follower_counts
  # POST /follower_counts.json
  def create
    @follower_count = FollowerCount.new(follower_count_params)

    respond_to do |format|
      if @follower_count.save
        format.html { redirect_to @follower_count, notice: 'Follower count was successfully created.' }
        format.json { render :show, status: :created, location: @follower_count }
      else
        format.html { render :new }
        format.json { render json: @follower_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follower_counts/1
  # PATCH/PUT /follower_counts/1.json
  def update
    respond_to do |format|
      if @follower_count.update(follower_count_params)
        format.html { redirect_to @follower_count, notice: 'Follower count was successfully updated.' }
        format.json { render :show, status: :ok, location: @follower_count }
      else
        format.html { render :edit }
        format.json { render json: @follower_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follower_counts/1
  # DELETE /follower_counts/1.json
  def destroy
    @follower_count.destroy
    respond_to do |format|
      format.html { redirect_to follower_counts_url, notice: 'Follower count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower_count
      @follower_count = FollowerCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follower_count_params
      params.require(:follower_count).permit(:candidate_id, :twitter_follwers)
    end
end
