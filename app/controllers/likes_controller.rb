class LikesController < ApplicationController
   before_action :find_job
   before_action :find_like, only: [:destroy]

  def create
    if already_liked?
        flash[:notice] = "You can't like more than once"
    else
        @job.likes.create(user_id: current_user.id)
    end
    redirect_to job_path(@job)
  end
  
  def destroy
    if !(already_liked?)
        flash[:notice] = "Cannot unlike"
    else
        @like.destroy
    end
    redirect_to job_path(@job)
  end
  
  private
  def find_job
    @job = Job.find(params[:job_id])
  end
  def find_like
    @like = @job.likes.find(params[:id])
  end
  def already_liked?
    Like.where(user_id: current_user.id, job_id: params[:job_id]).exists?
  end
end