{
    "Comment": "Provision then run an ansible playbook",
    "StartAt": "PreProvision",
    "States": {
      "PreProvision": {
        "Type": "Pass",
        "Next": "CreateDirectoryAndFile"
      },
      "CreateDirectoryAndFile":{
        "Type": "Task",
        "Resource": "manageiq://embedded_ansible",
        "Parameters": {
          "RepositoryUrl": "https://github.com/MD-JAVEED-AKTAR/ansible-example",
          "RepositoryBranch": "main",
          "PlaybookName": "createDirectory.yml",
          "Hosts.$": "$.ipaddress"
        },
        "Next": "Finished"
      },
      "Finished": {
        "Type": "Succeed"
      }
    }
  }
