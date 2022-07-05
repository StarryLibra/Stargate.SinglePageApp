<template>
  <Layout>
    <div>
      <div style="margin: 1rem 0;">
        <PiniaLogo />
      </div>

      <h2>Hello {{ user.name }}</h2>

      <form @submit.prevent="addItemToCart" data-testid="add-items">
        <input type="text" v-model="itemName" />
        <button>Add</button>
      </form>

      <form @submit.prevent="buy">
        <ul data-testid="items">
          <li v-for="item in cart.items" :key="item.name">
            {{ item.name }} ({{ item.amount }})
            <button
              @click="cart.removeItem(item.name)"
              type="button"
            >X</button>
          </li>
        </ul>

        <button :disabled="!user.name">Buy</button>
        <button
          :disabled="!cart.items.length"
          @click="clearCart"
          type="button"
          data-testid="clear"
        >Clear the cart</button>
      </form>
    </div>
  </Layout>
</template>

<script lang="ts">
import Layout from '@/layouts/PiniaDefault.vue'
import PiniaLogo from '@/components/PiniaLogo.vue'

import { defineComponent, ref } from 'vue'
import { useUserStore } from '@/stores/user.js'
import { useCartStore } from '@/stores/cart.js'

export default defineComponent({
  components: { Layout, PiniaLogo },

  setup() {
    const user = useUserStore()
    const cart = useCartStore()

    const itemName = ref('')

    function addItemToCart() {
      if (!itemName.value) return
      cart.addItem(itemName.value)
      itemName.value = ''
    }

    function clearCart() {
      if (window.confirm('Are you sure you want to clear the cart?')) {
        cart.rawItems = []
      }
    }

    async function buy() {
      const n = await cart.purchaseItems()

      console.log(`Bought ${n} items`)

      cart.rawItems = []
    }

    // @ts-ignore
    window.stores = { user, cart }

    return {
      itemName,
      addItemToCart,
      cart,

      user,
      buy,
      clearCart,
    }
  },
})
</script>

<style scoped>
img {
  width: 200px;
}

button {
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
  display: inline-block;
  padding: 6px 12px;
  background: #0070f3;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  cursor: pointer;
  color: #fff;
}

input {
  padding: 6px 12px;
  margin: 0 8px 8px 0;
  background: #f6f8fa;
  color: #1a1a1a;
  border: 1px solid #e5e7e8;
  border-radius: 4px;
  box-shadow: none;
  box-sizing: border-box;
}
</style>
