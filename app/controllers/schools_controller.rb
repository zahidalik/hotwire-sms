class SchoolsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @schools = @user.schools
    else
      @schools = School.all
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @school = @user.schools.new
  end

  def create
    @user =  User.find(params[:user_id])
    @school = @user.schools.new(school_params)
    
    respond_to do |format|
      if @school.save
        format.turbo_stream 
        format.html {redirect_to user_path(@user)}
      end
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    respond_to do |format|
      if @school.update(school_params)
        format.turbo_stream
        format.html { redirect_to @school, notice: "School was successfully updated." }
      else
        format.turbo_stream
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :head_master, :academic_head)
  end
end