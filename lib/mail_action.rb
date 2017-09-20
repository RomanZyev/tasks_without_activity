require_dependency 'mailer'

module Patches
  module MailerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)      
    end
    
   module InstanceMethods
      
     def without_activity(scope,resipient,users = [])
       @issues = scope
       @users = users       
       mail :to => resipient,
            :subject => l("without activity")
        
      end
    end
  end
end
