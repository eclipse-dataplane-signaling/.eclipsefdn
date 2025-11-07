local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.dataplane-signaling', 'eclipse-dataplane-signaling') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Data Plane Signaling project",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('dataplane-signaling') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Specification covering Dataspace control plane communication with data planes",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://webhook.zenhub.com/webhook/github/v2') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "label",
            "member",
            "meta",
            "milestone",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "repository",
            "sub_issues",
            "team_add"
          ],
          secret: "********",
        },
      ],
    },
  ],
}
