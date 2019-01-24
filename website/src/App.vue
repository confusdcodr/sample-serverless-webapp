<template>
  <div id="app">
    <Navigation v-bind:signedIn="this.$store.state.signedIn" v-on:signout="signout()"></Navigation>
    <router-view></router-view>
  </div>
</template>

<style scoped>
  ul {
    list-style: none;
    display: flex;
    padding: 0;
  }
  li {
    padding: 5px 15px 5px 0;
  }
  li a {
    text-decoration: none;
    color: black;
  }
  li a:hover {
    color: #404040;
  }
</style>

<script>
import { Auth } from 'aws-amplify';
import { AmplifyEventBus } from 'aws-amplify-vue';
import Navigation from "@/components/Navigation";

export default {
    name: "App",
    components: {
        Navigation
    },
    data: function() {
        return {
        }
    },
    computed: {
    },  
    created() {
    },  
    methods: {
        signout: function() {
            let self = this

            Auth.signOut()
               .then(function() {
                    self.$store.commit('signOut')
               })
               .catch(err => console.log(err));
            this.$router.push({ name: 'Home', query: { redirect: '/' } });
        }
    }
}
</script>
