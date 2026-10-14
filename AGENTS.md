# Instructions for agents working in the MRBS application

## Work branch and repository boundaries

- Continue app work on branch `elkato`; do not continue on
  `merge-mrbs-v1.12.2`.
- The app repository is `being-peace/mrbs-code`. The separate private
  infrastructure repository is `being-peace/fahrteiler-infra`.
- For deployment/environment tasks, read the infra repository's
  `AGENTS.md` and `docs/DEPLOYMENT-RUNBOOK.md` first. In this workspace they
  are under `/srv/fahrteiler/repos/infra/`; the canonical docs are also in the
  private `fahrteiler-infra` GitHub repository.
- Deployments use an explicit commit from this repository and upload only
  `web/` plus the configured tenant/runtime overlays. Never assume uncommitted
  app changes are deployed.

## Scope and safety

- This project work is about the Development/Acceptance/Production
  architecture and deployment unless the user explicitly expands the scope.
  Do not invent requirements for money, tariffs, billing, capacity, or booking
  state.
- Do not change existing production or legacy database tables from app code
  tasks. Database operations and environment table prefixes are documented in
  the infra runbook.
- Never commit credentials, private access files, database dumps, or generated
  production data.
- Do not install software without the user's explicit approval. The user
  requires system-managed package installation.
- Preserve unrelated and untracked files. Do not stage all files, delete
  untracked content, force-push, or push changes unless requested.

## Current untracked user work

The following paths were intentionally left untracked by the user and must be
preserved unless the user explicitly asks otherwise:

- `.github/prompts/`
- `.github/skills/`
- `openspec/`
- `test/test_local_config.php`
- `test/test_site_config.php`
- `test/test_site_config_env.php`

Stage only files belonging to the requested change.
