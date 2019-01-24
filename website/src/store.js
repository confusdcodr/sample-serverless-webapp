import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    // define data for store
    state: {
        signedIn: false,
        user: null
    },
    // synchronous actions
    mutations: {
        signIn(state, payload) {
            state.signedIn = true
            state.user = payload
        },
        signOut(state) {
            state.signedIn = false
            state.user = null
        }
    },
    // asynchronous actions
    actions: {

    },
    // returns information about the state
    getters: {
        user(state) {
            return state.user;
        }
    }
});
