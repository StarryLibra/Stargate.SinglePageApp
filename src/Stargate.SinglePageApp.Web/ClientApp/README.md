# stargate-spa-vue

This template should help get you started developing with Vue 3 and TypeScript in Vite. The template uses Vue 3 `<script setup>` SFCs, check out the [script setup docs](https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup) to learn more.

## Recommended IDE Setup

- [VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Type Support for `.vue` Imports in TS

Since TypeScript cannot handle type information for `.vue` imports, they are shimmed to be a generic Vue component type by default. In most cases this is fine if you don't really care about component prop types outside of templates. However, if you wish to get actual prop types in `.vue` imports (for example to get props validation when using manual `h(...)` calls), you can enable Volar's Take Over mode by following these steps:

1. Run `Extensions: Show Built-in Extensions` from VS Code's command palette, look for `TypeScript and JavaScript Language Features`, then right click and select `Disable (Workspace)`. By default, Take Over mode will enable itself if the default TypeScript extension is disabled.
2. Reload the VS Code window by running `Developer: Reload Window` from the command palette.

You can learn more about Take Over mode [here](https://github.com/johnsoncodehk/volar/discussions/471).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
pnpm install
```

### Compile and Hot-Reload for Development

```sh
pnpm run dev
```

### Type-Check, Compile and Minify for Production

```sh
pnpm run build
```

### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
pnpm run test:unit
```

### Run End-to-End Tests with [Cypress](https://www.cypress.io/)

```sh
pnpm run build
pnpm run test:e2e # or `npm run test:e2e:ci` for headless testing
```

### Lint with [ESLint](https://eslint.org/)

```sh
pnpm run lint
```

## Related

### dependencies
- [axios](https://github.com/axios/axios)
: Promise based HTTP client for the browser and node.js
- [date-fns](https://github.com/date-fns/date-fns)
: ⏳ Modern JavaScript date utility library ⌛️
- [Pinia](https://github.com/vuejs/pinia) 
: 🍍 Intuitive, type safe, light and flexible Store for Vue using the composition api with DevTools support
- [vue-router](https://github.com/vuejs/router)
: 🚦 The official router for Vue.js
- [vuejs/core](https://github.com/vuejs/core)
: 🖖 Vue.js is a progressive, incrementally-adoptable JavaScript framework for building UI on the web.
- [VueRequest](https://github.com/Attojs/vue-request)
: ⚡️ Vue 3 composition API for data fetching, supports SWR, polling, error retry, cache request, pagination, etc.
- [VueUse](https://github.com/vueuse/vueuse)
: Collection of essential Vue Composition Utilities for Vue 2 and 3

### devDependencies
- [@vue/tsconfig](https://github.com/vuejs/tsconfig)
: Base tsconfig for Vue 3 projects.
- [Cypress](https://github.com/cypress-io/cypress)
: Fast, easy and reliable testing for anything that runs in a browser.
    - [Cypress ESLint Plugin](https://github.com/cypress-io/eslint-plugin-cypress)
    : An ESLint plugin for projects that use Cypress
- [Definitely Typed](https://github.com/DefinitelyTyped/DefinitelyTyped)
: The repository for high quality TypeScript type definitions.
- [ESLint](https://github.com/eslint/eslint)
: Find and fix problems in your JavaScript code.
    - [eslint-plugin-vue](https://github.com/vuejs/eslint-plugin-vue)
    : Official ESLint plugin for Vue.js
- [jsdom](https://github.com/jsdom/jsdom)
: A JavaScript implementation of various web standards, for use with Node.js
- [Naive UI](https://github.com/TuSimple/naive-ui)
: A Vue 3 Component Library. Fairly Complete. Theme Customizable. Uses TypeScript. Fast.
    - [vfonts](https://github.com/07akioni/vfonts)
    : Integreted fonts for easy usage.
    - [xicons](https://github.com/07akioni/xicons)
    : SVG Vue/React components integrated from fluentui-system-icons, ionicons, ant-design-icons, material-design-icons, Font-Awesome, tabler-icons and carbon icons. (Vue3, Vue2, React, SVG)
- [Prettier](https://github.com/prettier/prettier)
: Prettier is an opinionated code formatter.
    - [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier)
    : Turns off all rules that are unnecessary or might conflict with [Prettier](https://github.com/prettier/prettier).
    - [eslint-plugin-prettier](https://github.com/prettier/eslint-plugin-prettier)
    : ESLint plugin for Prettier formatting
- [Rush Stack](https://github.com/microsoft/rushstack)
: Monorepo for tools developed by the Rush Stack community
- [start-server-and-test](https://github.com/bahmutov/start-server-and-test)
: Starts server, waits for URL, then runs test command; when the tests end, shuts down server
- [TypeScript](https://github.com/Microsoft/TypeScript)
: TypeScript is a superset of JavaScript that compiles to clean JavaScript output.
- [vue-tsc](https://github.com/johnsoncodehk/volar/tree/master/packages/vue-tsc)
: Vue 3 command line Type-Checking tool base on IDE plugin [Volar](https://github.com/johnsoncodehk/volar).
- [Vite ⚡](https://github.com/vitejs/vite)
: Next generation frontend tooling. It's fast!
    - [@vitejs/plugin-vue-jsx](https://github.com/vitejs/vite/tree/main/packages/plugin-vue-jsx)
    : Provides Vue 3 JSX & TSX support with HMR.
- [Vitest](https://github.com/vitest-dev/vitest)
: A Vite-native test framework. It's fast!
- [Vue Test Utils](https://github.com/vuejs/test-utils)
: Vue Test Utils for Vue 3
