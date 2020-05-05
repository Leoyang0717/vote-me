class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end
  def new
    @candidate = Candidate.new
  end
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
    redirect_to '/candidates'
    flash[:notice] = "Candidate created!"
    else
      render :new #引導至 new.html.erb檔
    end
  end
  def show
   @candidate = Candidate.find_by(id: params[:id])
  end
  def edit
   @candidate = Candidate.find_by(id: params[:id])
  end
  def update
  @candidate = Candidate.find_by(id: params[:id])
  if @candidate.update(candidate_params)
    redirect_to '/candidates'
    flash[:notice] = "Candidate updated!"
    else
      render :edit #引導至 edit.html.erb檔
    end
  end
  def destroy
  @candidate = Candidate.find_by(id: params[:id])
  @candidate.destroy
  flash[:notice] = "Candidate deleted!"
  redirect_to '/candidates'
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name ,:party, :age , :politics)
  end
end