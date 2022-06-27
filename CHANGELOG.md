# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this
project adheres to [Semantic Versioning](http://semver.org/).

<a name="unreleased"></a>
## [Unreleased]



<a name="v0.4.0"></a>
## [v0.4.0] - 2022-06-25
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


[Unreleased]: https://github.com/huma-engineering/helm-charts/compare/v0.4.0...HEAD
[v0.4.0]: https://github.com/huma-engineering/helm-charts/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/huma-engineering/helm-charts/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/huma-engineering/helm-charts/compare/v0.1.0...v0.2.0
