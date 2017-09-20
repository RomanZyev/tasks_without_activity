require_dependency 'issue'

module PatchesController
  module IssuesControllerPatch
    def self.included( base )
      base.send(:include, InstanceMethods)       
      #base.class_eval do
        #unloadable
        
       # alias_method_chain :index, :activity            
      #end
    end
    module InstanceMethods
    	def index_with_activity
    		#@issues = Issues.find(params[:project_id])
    	end
    end
  end
end
