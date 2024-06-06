# My NVC App (temporary name)
- [GitHub project for the app](https://github.com/users/islomar/projects/4/views/1)

`yarn create-expo-app my-nvc-app --template tabs`

yarn tsc --> type check your project's files

yarn add -D ts-node
npm install -g eas-cli

## Steps
- `yarn create expo-app --template tabs`
- `yarn add eslint-plugin-jest typescript-eslint --dev`


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

## Notes about Expo
- [Expo examples](https://github.com/expo/examples)
- Expo never locks you in
- Expo SDK
- Native Modules (you can create your own native modules) 
- Prebuild
- Expo CLI
- Expo Go: preview our application
- Expo Application Services
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