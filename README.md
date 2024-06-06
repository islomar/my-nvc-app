# My NVC App (temporary name)

- [GitHub project for the app](https://github.com/users/islomar/projects/4/views/1)
- [EAS builds](https://expo.dev/accounts/islomar/projects/my-nvc-app/builds)

## Steps

- `yarn create expo-app --template tabs`
- `yarn add eslint-plugin-jest typescript-eslint --dev`
- `yarn add -D prettier eslint-config-prettier eslint-plugin-prettier`
- `yarn add --dev eslint-config-universe`
- Create "Access token" in Expo and define it as "Action secret" in GitHub
  - https://docs.expo.dev/eas-update/github-actions/

## Build

### General

- [Reusing GH Actions workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows): For a workflow to be reusable, the values for on must include `workflow_call:`
- [GitHub Enterprise pricing](https://github.com/pricing)
  - $21 per user/month
  - Required for having manual approval in GH Actions Workflow IF the repository is private
  - https://docs.github.com/en/actions/managing-workflow-runs/reviewing-deployments

### Android on EAS

- https://expo.dev/accounts/islomar/projects/my-nvc-app/builds/f8ee5b2e-d141-494c-a98f-440daf12745f
- Duration: 12 minutes

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

## Notes about Expo

- [Expo examples](https://github.com/expo/examples)
- We have Expo Push Notifications
- You don't need to eject from Expo anymore. Now, the solution is [Prebuild](https://docs.expo.dev/workflow/prebuild/)
- You need to install de dependencies running `yarn expo install <library-name>`, not with `yarn/npm install <library-name>`, since not all npm libreries work correctly with Expo and they keep their own versions.
  - https://docs.expo.dev/workflow/using-libraries/#installing-a-third-party-library
- If you want to quickly create a cross-platform app from your web application: https://capacitorjs.com/

## References

- [Video: Build Your App For Production EASY 💰 Expo + React Native](https://www.youtube.com/watch?v=Tx_u902DER0)
- https://github.com/thedevenvironment/expo-router-typescript
  - Styled components
  - TypeScript
- https://galaxies.dev/quickwin/start-react-native-app
