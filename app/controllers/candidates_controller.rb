class CandidatesController < ApplicationController

before_action :find_candidate , except:[ :index , :new , :create]

  def index
    @candidates = Candidate.all
  end
  def new
    @candidate = Candidate.new
  end
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
    redirect_to '/candidates' , notice: "Candidate created!"
    else
      render :new #引導至 new.html.erb檔
    end
  end
  def show
  end
  def edit
  end
  def update
  if @candidate.update(candidate_params)
    redirect_to '/candidates' , notice: "Candidate updated!"
    else
      render :edit #引導至 edit.html.erb檔
    end
  end
  def destroy
  @candidate.destroy
  redirect_to '/candidates', notice: "Candidate deleted!"
  end

  def vote
  @candidate.vote_logs.create(ip_address:request.remote_ip)
redirect_to '/candidates' , notice: "Voted!"
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name ,:party, :age , :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end