class VirtualmachinesController < ApplicationController
  # GET /virtualmachines
  # GET /virtualmachines.json
  def index
    @virtualmachines = Virtualmachine.all

    @result = `ls -l`

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @virtualmachines }
    end
  end

  # GET /virtualmachines/1
  # GET /virtualmachines/1.json
  def show
    @virtualmachine = Virtualmachine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @virtualmachine }
    end
  end

  # GET /virtualmachines/new
  # GET /virtualmachines/new.json
  def new
    @virtualmachine = Virtualmachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @virtualmachine }
    end
  end

  # GET /virtualmachines/1/edit
  def edit
    @virtualmachine = Virtualmachine.find(params[:id])
  end

  # POST /virtualmachines
  # POST /virtualmachines.json
  def create
    @virtualmachine = Virtualmachine.new(params[:virtualmachine])

    respond_to do |format|
      if @virtualmachine.save
        format.html { redirect_to @virtualmachine, :notice => 'Virtualmachine was successfully created.' }
        format.json { render :json => @virtualmachine, :status => :created, :location => @virtualmachine }
      else
        format.html { render :action => "new" }
        format.json { render :json => @virtualmachine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /virtualmachines/1
  # PUT /virtualmachines/1.json
  def update
    @virtualmachine = Virtualmachine.find(params[:id])

    respond_to do |format|
      if @virtualmachine.update_attributes(params[:virtualmachine])
        format.html { redirect_to @virtualmachine, :notice => 'Virtualmachine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @virtualmachine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /virtualmachines/1
  # DELETE /virtualmachines/1.json
  def destroy
    @virtualmachine = Virtualmachine.find(params[:id])
    @virtualmachine.destroy

    respond_to do |format|
      format.html { redirect_to virtualmachines_url }
      format.json { head :no_content }
    end
  end
end
