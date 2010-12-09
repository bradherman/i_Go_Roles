# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class IGoRolesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/i_go_roles"

  class MissingRequirement < StandardError; end
  
  def activate
    
    ############# Access List #############

    ######## Give tag acces to admin and publisher ########
    #######################################################
    #Admin::TagsController.class_eval {
    #  only_allow_access_to(:index, :show, :cloud,
    #    :when => [:admin, :publisher], # figure how to add multiple
    #    :denied_url => {:controller => 'welcome', :action => 'index'},
    #    :denied_message => "You do not have access to tags.")
    #}
    
    
    
    ############# To Do for Writer #############
    # Remove Delete Link next to Pages not created by this user
    # Remove status update field
    # Remove "save" fields from non-owned pages
    ############################################
    
    ############# To Do for Editor #############
    # Remove delete link from published stories
    ############################################
    
    ############# To Do for Publisher #############
    # Give tag access
    ###############################################
    
    admin.page.index[:node].delete('remove_column')
    admin.page.index.add :node, 'remove_column_subject_to_permissions', :after => "add_child_column"
    
    # remove publish feature 
    # admin.page.edit[:partial].delete('page_status_id')
  end
end
