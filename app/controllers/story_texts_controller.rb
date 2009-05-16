class StoryTextsController < ApplicationController
  # GET /story_texts
  # GET /story_texts.xml
  def index
    @story_texts = StoryText.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @story_texts }
    end
  end

  # GET /story_texts/1
  # GET /story_texts/1.xml
  def show
    @story_text = StoryText.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story_text }
    end
  end

  # GET /story_texts/new
  # GET /story_texts/new.xml
  def new
    @story_text = StoryText.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story_text }
    end
  end

  # GET /story_texts/1/edit
  def edit
    @story_text = StoryText.find(params[:id])
  end

  # POST /story_texts
  # POST /story_texts.xml
  def create
    @story_text = StoryText.new(params[:story_text])

    respond_to do |format|
      if @story_text.save
        flash[:notice] = 'StoryText was successfully created.'
        format.html { redirect_to(@story_text) }
        format.xml  { render :xml => @story_text, :status => :created, :location => @story_text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /story_texts/1
  # PUT /story_texts/1.xml
  def update
    @story_text = StoryText.find(params[:id])

    respond_to do |format|
      if @story_text.update_attributes(params[:story_text])
        flash[:notice] = 'StoryText was successfully updated.'
        format.html { redirect_to(@story_text) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /story_texts/1
  # DELETE /story_texts/1.xml
  def destroy
    @story_text = StoryText.find(params[:id])
    @story_text.destroy

    respond_to do |format|
      format.html { redirect_to(story_texts_url) }
      format.xml  { head :ok }
    end
  end
end
