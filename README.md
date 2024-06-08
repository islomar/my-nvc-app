[![Run linters and tests](https://github.com/islomar/my-nvc-app/actions/workflows/run-linters-and-tests.yml/badge.svg)](https://github.com/islomar/my-nvc-app/actions/workflows/run-linters-and-tests.yml)

# My NVC App (temporary name)

- [GitHub project for the app](https://github.com/users/islomar/projects/4/views/1)
- [EAS builds](https://expo.dev/accounts/islomar/projects/my-nvc-app/builds)

## Steps

- `yarn create expo-app --template tabs`
- `yarn add eslint@8 eslint-plugin-jest typescript-eslint --dev`
- `yarn add -D prettier eslint-config-prettier eslint-plugin-prettier`
- `yarn add --dev eslint-config-universe`
- Create "Access token" in Expo and define it as "Action secret" in GitHub
  - https://docs.expo.dev/eas-update/github-actions/
- Configure [EAS Update](https://docs.expo.dev/eas-update/introduction/): it makes fixing small bugs and pushing quick fixes a snap in between app store submissions.

## Build

### General

- [Reusing GH Actions workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows): For a workflow to be reusable, the values for on must include `workflow_call:`
- https://dev.to/medaimane/continuous-integration-and-deployment-for-react-native-apps-streamlining-development-workflow-4i04
- [Limit concurrency: only publish the most recent change](https://meijer.ws/articles/manual-approvals-in-github-actions#only-publish-the-most-recent-change)
- [GitHub Enterprise pricing](https://github.com/pricing)
  - $21 per user/month
  - Required for having manual approval in GH Actions Workflow IF the repository is private
  - https://docs.github.com/en/actions/managing-workflow-runs/reviewing-deployments
  - https://meijer.ws/articles/manual-approvals-in-github-actions

## Development

- Update a specific package `yarn upgrade <package-name> --latest`

### Locally build for Android

https://docs.expo.dev/build/setup/

```shell
npm install -g eas-cli
eas login --sso
eas build:configure
eas build --platform android  # Sync action
npx eas-cli build --platform all --non-interactive --no-wait  # Async action, an URL will be printed linking to the build's progress inthe EAS dashboard
```

### Android on EAS

- https://expo.dev/accounts/islomar/projects/my-nvc-app/builds/f8ee5b2e-d141-494c-a98f-440daf12745f
  - Duration: 12 minutes
- https://meijer.ws/articles/manual-approvals-in-github-actions
- [Manual Approval in a GitHub Actions Workflow](https://trstringer.com/github-actions-manual-approval/)
  - You don't need the GH Enterprise!!!

## Decisions taken

- Use of **yarn**
  - https://bun.sh/docs/installation
  - Faster than npm
  - More stable ~~boring~~ than bun
    - https://yarnpkg.com/blog/bun
    - https://dev.to/thejaredwilcurt/bun-hype-how-we-learned-nothing-from-yarn-2n3j
- [Prettier and ESLint](https://docs.expo.dev/guides/using-eslint/)
  - [ESLint rules](https://eslint.org/docs/latest/rules/)
  - https://github.com/jest-community/eslint-plugin-jest/tree/main/docs/rules
- Maestro for the e2e tests
  - [Choosing a new framework for Mobile UI Testing for React Native](https://medium.com/@joemcguinness/choosing-a-new-framework-for-mobile-ui-testing-for-react-native-08f1cd3a4042)
  - `detox` is another option, out-of-the-box in Bitrise
- Stay in ESLint 8.x for the moment
  - https://github.com/expo/expo/issues/28144

### Options for generating the binaries and submitting to the Stores

- **Option 1: GH Actions + EAS**
  - Suboption 1: everything declared in the GH Action pipeline
  - Suboption 2: Webhook configured on EAS which would trigger there the build and submission (no full visibility from the pipeline?)
  - You can trigger a build from a GitHub PR by adding a label to the PR. The label must be in the form of `eas-build-[platform]:[profile]`
  - https://docs.expo.dev/build/building-from-github/
  - https://docs.expo.dev/build/internal-distribution/
  - https://docs.expo.dev/build/building-from-github/#automatic-app-stores-submission-with-eas-submit
- **Option 2: Bitrise**
  - https://bitrise.io/solutions/technologies/react-native
  - https://www.youtube.com/watch?v=larcX3I6xX0
  - Price: 90 €/month
- **Option 3: GH Actions + Fastlane + MacStadium**
  - https://fastlane.tools/
  - Fastlane handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.
  - Also for beta distribution
  - You need to install it in your own machines (e.g. with MacStadium or [your own Mac Mini](https://www.scaleway.com/en/docs/tutorials/install-github-actions-runner-mac/), etc.)
  - Free
- **Examples**
  - https://github.com/bluesky-social/social-app/blob/main/.github/workflows/build-submit-android.yml

## Notes about Expo

- [Expo examples](https://github.com/expo/examples)
- We have Expo Push Notifications
- You don't need to eject from Expo anymore. Now, the solution is [Prebuild](https://docs.expo.dev/workflow/prebuild/)
- You need to install de dependencies running `yarn expo install <library-name>`, not with `yarn/npm install <library-name>`, since not all npm libreries work correctly with Expo and they keep their own versions.
  - https://docs.expo.dev/workflow/using-libraries/#installing-a-third-party-library
- If you want to quickly create a cross-platform app from your web application: https://capacitorjs.com/

## Lessons learnt

- You should NOT upgrade all the packages in an uncontrolled way: each Expo version recommends some specific library versions (and not higher)
- The `ios.bundleIdentifier` is required to be set in `app.json` config when running in non-interactive mode
  - https://docs.expo.dev/submit/ios/

## References

- [Video: Build Your App For Production EASY 💰 Expo + React Native](https://www.youtube.com/watch?v=Tx_u902DER0)
- https://github.com/thedevenvironment/expo-router-typescript
  - Styled components
  - TypeScript
- https://galaxies.dev/quickwin/start-react-native-app
- [Android App Bundle](https://developer.android.com/guide/app-bundle):
  - `.aab`, only for publishing, it cannot be installed on Android devices
  - An Android App Bundle is a publishing format that includes all your app's compiled code and resources, and defers APK generation and signing to Google Play.
