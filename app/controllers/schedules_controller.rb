class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    
    @schedules = Schedule.all
    @schedules = Schedule.where("schedules.ymd > ?", Time.current.yesterday).reorder(:ymd)

    @answers = Answer.all
    @answers_sanka = Answer.sanka
    @answers_tabun = Answer.tabun
    @answers_mitei = Answer.mitei
    @answers_kesseki = Answer.kesseki
    @answer = Answer.new
    @answer.schedule_id = params[:id]

    @caution = '※チーム毎でサイト管理している為、パスワードを設けておりません。チーム幹事のみ編集してください。'
    
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedules = Schedule.where("schedules.ymd > ?", Time.current.yesterday).reorder(:ymd)
    @answers = Answer.all
    @answers_sanka = Answer.sanka
    @answers_tabun = Answer.tabun
    @answers_mitei = Answer.mitei
    @answers_kesseki = Answer.kesseki

    if params[:id]
      schedule = Schedule.find(params[:id])
    else
      schedule = Schedule.uketsukechu.order(ymd: :asc).first
    end

    @answers_all = schedule.answer
    @answers_sanka = schedule.answer.sanka
    @answers_tabun = schedule.answer.tabun
    @answers_mitei = schedule.answer.mitei
    @answers_kesseki = schedule.answer.kesseki

    @answer = Answer.new
    @answer.schedule_id = params[:id]

    @caution = '※チーム毎でサイト管理している為、パスワードを設けておりません。チーム幹事のみ編集してください。'
  end

  # GET /schedules/kiyaku
  def kiyaku
  end
  
  # GET /schedules/new
  def new
    @schedules = Schedule.where("schedules.ymd > ?", Time.current.yesterday).reorder(:ymd)
    @schedules = Schedule.all
    @schedule = Schedule.new
    @schedules = Schedule.all.order(ymd: "ASC")
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to new_schedule_path, notice: 'スケジュールが作成されました。' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { redirect_to new_schedule_path, notice: '開催場所、もしくは詳細が記載されていません。' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to new_schedule_path, notice: 'スケジュールが更新されました。' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to new_schedule_path, notice: 'スケジュールが削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = if params[:id].blank?
        Schedule.uketsukechu.first
      else
        Schedule.find(params[:id])
      end
      # @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:ymd, :start, :end, :place, :addcomment)
    end
end
