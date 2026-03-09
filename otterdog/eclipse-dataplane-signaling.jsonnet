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
      gh_pages_build_type: "legacy",
      gh_pages_source_path: "/",
      gh_pages_source_branch: "gh-pages",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
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
    orgs.newRepo('endpoint-type-registry') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Collection of schemas extending the DataAddress object for specific data transfer types",
      gh_pages_build_type: "workflow",
      gh_pages_source_path: null,
      gh_pages_source_branch: null,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_pull_request: true,
          requires_status_checks: true,
        },
      ],
    },
    orgs.newRepo('best-practices') {
      allow_merge_commit: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Recommendations for implementing and extending the Data Plane Signaling specification",
      gh_pages_build_type: "workflow",
      gh_pages_source_path: null,
      gh_pages_source_branch: null,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_pull_request: true,
          requires_status_checks: true,
        },
      ],
    },
  ],
}
