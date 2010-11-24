# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class IGoRolesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/i_go_roles"

  class MissingRequirement < StandardError; end
  
  def activate
    ## Roles added in migrations
    Role.find_by_role_name('Publisher').destroy
    Role.find_by_role_name('Writer').destroy
    Role.find_by_role_name('Editor').destroy
    
    Role.create(
      :role_name => 'Publisher',
      :description => 'Publishers add, edit, delete, publish, and unpublish anything.', 
      :allow_empty => true)
    Role.create(
      :role_name => 'Writer', 
      :description => 'Writers may create content and edit their own.', 
      :allow_empty => true)
    Role.create(
      :role_name => 'Editor', 
      :description => 'Editors may create new content, edit all content, and delete unpublished.', 
      :allow_empty => true)

    Admin::TagsController.class_eval {
      only_allow_access_to(:index, :show, :cloud,
        :when => [:admin, :publisher], # figure how to add multiple
        :denied_url => {:controller => 'welcome', :action => 'index'},
        :denied_message => "You do not have access to tags.")
    }
    
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
  end
end
