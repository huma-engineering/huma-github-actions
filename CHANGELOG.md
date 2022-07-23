# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).

<a name="unreleased"></a>
## [Unreleased]



<a name="v0.8.0"></a>
## [v0.8.0] - 2022-07-21
Feature:
- [HCB-447] Pull new container images using rebuild command in PR preview

Improvement:
- Generate changelog


<a name="v0.7.1"></a>
## [v0.7.1] - 2022-06-30
Bug fix:
- [HCB-435] Suppress CI build container errors


<a name="v0.7.0"></a>
## [v0.7.0] - 2022-06-29
Feature:
- [HCB-430] automate removal of Grafana dashboard

refactor:
- [HCB-430] varible Grafana host


<a name="v0.6.0"></a>
## [v0.6.0] - 2022-06-29
Feature:
- [HCB-433] suppress CI errors for sync DB action
- [HCB-433] suppress CI errors for restore DB action
- [HCB-433] suppress CI errors for grafana action
- [HCB-433] suppress CI errors for deploy action

refactor:
- Rename result to error


<a name="v0.5.0"></a>
## [v0.5.0] - 2022-06-27
Feature:
- [HCB-432] Suppress uninstall action error and log it in a comment on PR


<a name="v0.4.0"></a>
## [v0.4.0] - 2022-06-27
Feature:
- [HCB-429] Clone an existing S3 bucket to a composed bucket
- [HCB-429] Copy GCS bucket contents to an existing S3 bucket action

Improvement:
- Always run clean up [skip ci]

refactor:
- New name copy-gcs-bucket-contents-to-composed-s3

Bug fix:
- Build container miss docker login
- No such file /copy-gcs-bucket-contents-to-composed-s3/copy-gcs-bucket-contents-to-composed-s3.sh


<a name="v0.3.0"></a>
## [v0.3.0] - 2022-06-23
Feature:
- [HCB-426] Create Grafana logs dashboard action

refactor:
- Use env in the copy bucket action [skip ci]
- Use env for scripts of restore MongoDB action [skip ci]
- Use env for scripts of restore MongoDB action [skip ci]


<a name="v0.2.0"></a>
## [v0.2.0] - 2022-06-22
Feature:
- [HCB-425] action Copy files from GCS to a new S3 bucket


<a name="v0.1.0"></a>
## v0.1.0 - 2022-06-17
Feature:
- [HCB-424] Build container action
- [HCB-423] Deploy Helm chart action
- [HCB-417] Convert the reusable-mongodb-restore workflow to a Github Action
- [HCB-422] use new uninstall action and /undeploy command
- [HCB-416] Convert the reusable-mongodb-dump workflow to a Github Action

Improvement:
- Pre-commit rules and git-chglog configuration


[Unreleased]: https://github.com/huma-engineering/helm-charts/compare/v0.8.0...HEAD
[v0.8.0]: https://github.com/huma-engineering/helm-charts/compare/v0.7.1...v0.8.0
[v0.7.1]: https://github.com/huma-engineering/helm-charts/compare/v0.7.0...v0.7.1
[v0.7.0]: https://github.com/huma-engineering/helm-charts/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/huma-engineering/helm-charts/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/huma-engineering/helm-charts/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/huma-engineering/helm-charts/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/huma-engineering/helm-charts/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/huma-engineering/helm-charts/compare/v0.1.0...v0.2.0
[HCB-447]: https://medopadteam.atlassian.net/browse/HCB-447
[HCB-435]: https://medopadteam.atlassian.net/browse/HCB-435
[HCB-433]: https://medopadteam.atlassian.net/browse/HCB-433
[HCB-432]: https://medopadteam.atlassian.net/browse/HCB-432
[HCB-430]: https://medopadteam.atlassian.net/browse/HCB-430
[HCB-429]: https://medopadteam.atlassian.net/browse/HCB-429
[HCB-426]: https://medopadteam.atlassian.net/browse/HCB-426
[HCB-425]: https://medopadteam.atlassian.net/browse/HCB-425
[HCB-424]: https://medopadteam.atlassian.net/browse/HCB-424
[HCB-423]: https://medopadteam.atlassian.net/browse/HCB-423
[HCB-422]: https://medopadteam.atlassian.net/browse/HCB-422
[HCB-417]: https://medopadteam.atlassian.net/browse/HCB-417
[HCB-416]: https://medopadteam.atlassian.net/browse/HCB-416
