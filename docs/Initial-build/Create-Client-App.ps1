npm install -g pnpm

pnpm create vue@latest stargate-spa-vue
# Add TypeScript: Yes
# Add JSX Support: Yes
# Add Vue Router for Single Page Applications development: Yes
# Add Pinia for state management: Yes
# Add Vitest for Unit Testing: Yes
# Add Cypress for End-toEnd testing: Yes
# Add ESLint for code quality: Yes
# Add Prettier for code formatting: Yes

cd stargate-spa-vue
pnpm install
pnpm run lint
#pnpm run dev

# Install 3rd party dependencies
pnpm install axios
pnpm install date-fns --save
pnpm i @vueuse/core
pnpm install vue-request
# Install 3rd party develop dependencies
pnpm i -D naive-ui
pnpm i -D vfonts
pnpm i -D @vicons/fluent
pnpm i -D @vicons/ionicons4
pnpm i -D @vicons/ionicons5
pnpm i -D @vicons/antd
pnpm i -D @vicons/material
pnpm i -D @vicons/fa # font awesome
pnpm i -D @vicons/tabler
pnpm i -D @vicons/carbon
pnpm i vite-plugin-pwa -D
