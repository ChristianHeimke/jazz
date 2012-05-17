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
    @ips = Array.new

    # get all networks
    networks = Network.all
    # get all ips from the network
    networks.each do |network|
      # calculate ip range
      mask = 255 - network.maske.to_i - 1
      base_ip = network.ip
      segments = base_ip.split '.'
      prefix = segments[0] + "." +segments[1] + "." + segments[2] + "."
      start = segments[3].to_i

      @ips.push(network.ip)

      # create array with ips
      for i in 0...mask do
        _ip = prefix +  (start + i + 1).to_s

        vm = Virtualmachine.where("ip = ?", _ip)

        if(vm.count < 1)
          @ips.push(" |- " + _ip)
        end



      end
    end



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
    vm = params[:virtualmachine]

    # strip the |- format string
    vm["ip"] = vm["ip"].to_s[4...vm["ip"].size]

    # create new vm
    @virtualmachine = Virtualmachine.new(vm)

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
