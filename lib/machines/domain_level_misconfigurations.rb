module Intrigue
module Machine
  class DomainMisconfigurations < Intrigue::Machine::Base

    def self.metadata
      {
        :name => "domain_misconfigurations",
        :pretty_name => "Check Domain Misconfigurations",
        :passive => true,
        :user_selectable => false,
        :authors => ["jcran"],
        :description => "This machine checks for common misconfigurations in a TLD."
      }
    end

    def self.recurse(entity, task_result)
      if entity.type_string == "Domain"
        start_recursive_task(task_result,"aws_s3_brute",entity)
        start_recursive_task(task_result,"saas_google_groups_check",entity)
        start_recursive_task(task_result,"saas_trello_check",entity)
        start_recursive_task(task_result,"saas_jira_check",entity)
      end
    end

end
end
end
