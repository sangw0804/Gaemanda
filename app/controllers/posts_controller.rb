class PostsController < ApplicationController
  before_action :is_logged?
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @posts = Post.where(match_id: params[:match_id])
    @post = Post.new
    @match_id = params[:match_id]
    @user_id = params[:user_id]
    @likee_id = params[:likee_id]
    @to_image = User.find(params[:likee_id]).image
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  # 이제 POST /post.js 가능
  def create

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_new_match_path(params["post"]["match_id"], params["post"]["from_id"], params["post"]["to_id"]), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js { render 'create.js.erb' }
      else
        # 여기는 에러 예외처리 부분인데 생략하자.
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:match_id, :content,:from_id,:to_id)
    end

    def is_logged?
      if !user_signed_in?
        redirect_to root_path
      end
    end
end
