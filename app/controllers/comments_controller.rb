class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_movie
  before_action :set_comment, only: %i[ edit update destroy ]
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @movie.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user_id=current_user.id
    respond_to do |format|
      if @comment.save
        @comments = @movie.comments
        format.html { redirect_to movie_url(@movie), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :'movies/show', status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @comments = @movie.comments
        format.html { redirect_to movie_url(@movie), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to movie_url(@movie), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @movie.comments.find(params[:id])
    end
    def set_movie
      @movie= Movie.find(params[:movie_id])
    end
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description)
    end
end
