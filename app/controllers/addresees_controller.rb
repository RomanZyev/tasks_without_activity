class AddreseesController < ApplicationController
  unloadable

  def index
    @addresees = Addresees.all
  end

  def new
    @addresee = Addresees.new
  end

  def edit
    @addresee = Addresees.find(params[:id])
    
    @scope = Project.where("#{Project.table_name}.status = #{Project::STATUS_ACTIVE}")
    
    @addresees_property = AddreseesProperty.where("addresee_id" =>params[:id]).pluck("project_id")
  end
  
   def create
    @addresee = Addresees.create(addresee_params)    
    if @addresee.save
      redirect_to action: :index
    else
      render :action => 'edit'
    end
  end

   def update
    update_main
    
    @addresee = Addresees.find(params[:id])
    
    @addresee.update_attributes(addresee_params)
    if @addresee.save
      redirect_to action: :index
    else
      render :action => 'edit'
    end
  end

  def destroy
    @addresee = Addresees.find(params[:id])
    @addresee.destroy
    redirect_to action: :index
  end
  
   def update_main
    id = params[:id]
    @new_project = params[:project_id]
    @old_project = AddreseesProperty.where("addresee_id" =>id).pluck("project_id")

    if @new_project != nil
      @new_project.each do |l|
        if !@old_project.include?(l.to_i)
          AddreseesProperty.new("addresee_id" =>id,"project_id" =>l.to_i).save
        end
      end
      @old_project.each do |l|
        if !@new_project.include?(l.to_s) && l != nil
          AddreseesProperty.where("addresee_id" =>id,"project_id" =>l).first.destroy
        end
      end
    else
      @old_project.each do |l|
        AddreseesProperty.where("addresee_id" =>id,"project_id" =>l).first.destroy
      end
    end
  end   
  
  def addresee_params
    params.require(:addresees).permit(:email)
  end
  
end
