class ListWithoutActivityController < ApplicationController
    def index
        array_issues = []
        @id_group = Setting.plugin_tasks_without_activity[:user_group] 
        user_ids = User.in_group(Group.find(@id_group)).pluck("id")
     
        scope_issue = Issue.open.where("#{Project.table_name}.status = #{Project::STATUS_ACTIVE}")
        scope_issue = scope_issue.includes(:status, :project).group_by(&:id) 
        
        scope_issue.each do |issues| 
            issues.each do |i| 
              scope_active = Journal.where(:journalized_type => "Issue")  
              scope_active = scope_active.where(:journalized_id => i)
              scope_active = scope_active.last()
              if scope_active != nil && user_ids.include?(scope_active.user_id)
                array_issues << i           
              end
            end
         end
         scope = Issue.open.where("#{Project.table_name}.status = #{Project::STATUS_ACTIVE}")
         scope = scope.where.not(:id => array_issues)
         @users = [] 
         @issues = scope.includes(:status, :assigned_to, :project, :tracker).order("project_id ASC").group_by(&:project)
                
    end
end