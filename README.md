# npm-publish-action

This is a GitHub Action for publishing npm packages.

If the action is triggered by a push to `main`, it will publish an npm package with a dynamically generated
version, e.g. `0.0.1-snapshot.1709644075`.  The suffix is the epoch time (in seconds) of the Git commit.

If the action is triggered by a new tag, it will publish an npm package with using the tag name as the version number, 
e.g. tag `v1.2.3` → version `1.2.3`.

It is **not** necessary for developers to manually set the `version` property in `package.json`.

---

## GitHub Workflow

Run this GitHub Action when a push is made to your `main` branch, or a new tag is created:

```yaml
---
name: Push

'on':
  push:
    branches:
      - 'main'
    tags:
      - 'v*'

jobs:
  build:
    steps:
    
    - name: Publish
      uses: sknups/npm-publish-action@v1        
```

## package.json

```json
{
  "name": "@sknups-internal/project-name",
  "version": "0.0.1-snapshot",
  "private": false
}
```
Ensure that your project name is prefixed with the appropriate scope, e.g. `@sknups-internal`.

Ensure that the `version` property is set to `0.0.1-snapshot`, there is no need to ever manually alter this value.

Ensure that the `private` property is set to `false`, or is absent.
